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

resource "aws_autoscaling_policy" "scale_out" {
  name                   = var.autoscaling_policy_name
  policy_type            = "SimpleScaling"
  autoscaling_group_name = var.autoscaling_group_name
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
}


