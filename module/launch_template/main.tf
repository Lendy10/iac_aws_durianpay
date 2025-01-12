terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }
  }
}

provider "aws" {
  region = var.region
  assume_role {
    role_arn     = var.arn
    session_name = "TerraformSession"
  }
}

resource "aws_launch_template" "app" {
  name = var.launch_template_name

  image_id      = var.ami_id # Example AMI ID for Ubuntu 20.04 in us-west-2 https://cloud-images.ubuntu.com/locator/ec2/
  instance_type = var.instance_type
  key_name      = "durianpay-keypair"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size           = var.volume_size
      volume_type           = "gp2"
      delete_on_termination = true
    }
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_groups_id]
  }

  iam_instance_profile {
    name = var.cloudwatch_profile_name
  }

  user_data = base64encode(<<-EOF
                #!/bin/bash
                # Update and install CloudWatch Agent
                apt-get update
                apt-get install -y amazon-cloudwatch-agent

                # Create agent configuration file using common settings
                mkdir -p /usr/share/collectd
                touch /usr/share/collectd/types.db

                cat > /opt/aws/amazon-cloudwatch-agent/bin/config.json <<EOL
                {
                  "agent": {
                    "metrics_collection_interval": 60,
                    "run_as_user": "cwagent"
                  },
                  "metrics": {
                    "metrics_collected": {
                      "mem": {
                        "measurement": [
                          "mem_used_percent"
                        ]
                      },
                      "swap": {
                        "measurement": [
                          "swap_used_percent"
                        ]
                      },
                      "disk": {
                        "measurement": [
                          "used_percent",
                          "inodes_free"
                        ],
                        "resources": [
                          "*"
                        ],
                        "ignore_file_system_types": [
                          "sysfs", "devtmpfs"
                        ]
                      }
                    }
                  }
                }
                EOL

                # Start the CloudWatch Agent
                systemctl enable amazon-cloudwatch-agent
                systemctl start amazon-cloudwatch-agent
                EOF
  )

  lifecycle {
    create_before_destroy = true
  }
}

