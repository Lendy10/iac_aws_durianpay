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

resource "aws_autoscaling_group" "app" {
  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  min_size = var.min_size
  max_size = var.max_size

  # Specify the subnet IDs;
  vpc_zone_identifier = [var.private_subnet_id]

  tag {
    key                 = var.autoscaling_group_tag_key
    value               = var.autoscaling_group_tag_value
    propagate_at_launch = true
  }
}
