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

resource "aws_vpc" "default" {
  cidr_block = var.cidr_block
  tags = {
    terraform : "True"
    Name = var.vpc_name
  }
}
