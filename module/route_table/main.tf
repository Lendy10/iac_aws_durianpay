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

resource "aws_route_table" "default" {
  vpc_id = var.vpc_id
  tags = {
    terraform : "True"
    Name = var.route_table_name
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
}

resource "aws_route_table_association" "default" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.default.id
}
