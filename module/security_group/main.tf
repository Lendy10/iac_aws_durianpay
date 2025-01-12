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

resource "aws_security_group" "app_sg" {
  name        = "durianpay-security-group"
  description = "Security group for application allowing traffic for durianpay assignment"
  vpc_id      = var.vpc_id # Ensure you have this variable defined or replace with your VPC ID

  # Inbound rules for TCP ports
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # General rule for all UDP traffic
  ingress {
    description = "UDP Traffic"
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # General rule for ICMP (ping)
  ingress {
    description = "ICMP"
    from_port   = -1 # ICMP has different type and code values for different requests, -1 means all types and codes
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Default egress rule: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Application Security Group"
  }
}
