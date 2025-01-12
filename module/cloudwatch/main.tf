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

resource "aws_cloudwatch_metric_alarm" "default" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.threshold
  alarm_actions       = [var.autoscaling_policy_arn]
  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }
}
