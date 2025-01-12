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

resource "aws_internet_gateway" "default" {
  vpc_id = var.vpc_id
  tags = {
    terraform : "True"
    Name = "main-internet-gateway"
  }
}

resource "aws_eip" "nat" {
  depends_on = [aws_internet_gateway.default]
}

resource "aws_nat_gateway" "default" {
  subnet_id     = var.subnet_id
  depends_on    = [aws_internet_gateway.default]
  allocation_id = aws_eip.nat.id

  tags = {
    Name = "MainNATGateway"
  }
}
