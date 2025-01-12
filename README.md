# 🚀 AWS Infrastructure Deployment Using Terraform and Terragrunt

## Introduction

This document outlines the DevOps assignment for DurianPay, focusing on deploying robust AWS infrastructure using Terraform and Terragrunt. This project showcases a high-availability setup designed to ensure scalability and performance, leveraging the power of Infrastructure as Code (IaC) to manage AWS resources efficiently.

## Overview

This project utilizes Terraform along with Terragrunt to provision and manage AWS infrastructure components including a VPC, subnets, a NAT Gateway, and an Auto Scaling group of EC2 instances. These components are equipped with CloudWatch monitoring to ensure the system's high availability and scalability. Terragrunt acts as a powerful wrapper to enhance configuration and state management.

## Infrastructure Components

- **VPC**: A Virtual Private Cloud to securely isolate and manage AWS resources.
- **Subnets**: Includes one public and one private subnet, catering to different security and accessibility needs.
- **Internet Gateway**: Facilitates internet connectivity for instances in the private subnet while maintaining their security from public access.
- **route table**: A route table is a collection of routes that specify how network traffic is directed between a subnet and an internet gateway or a virtual private gateway.
- **NAT Gateway**: Facilitates internet connectivity for instances in the private subnet while maintaining their security from public access.
- **Auto Scaling Group (ASG)**: Dynamically manages EC2 instances based on CPU utilization to ensure consistent performance and resource availability.
- **CloudWatch Monitoring**: Implements monitoring for critical metrics such as CPU usage, memory usage, status check failures, and network throughput.

## Scaling Policy

- **Scale Out**: Activated when CPU utilization reaches or exceeds 45%, adding instances to maintain optimal performance.

## CloudWatch Monitoring

- **CPU Monitoring**: Observes CPU utilization to trigger scaling actions as necessary.
- **Memory Usage**: Monitors memory consumption to prevent overutilization.
- **Status Check Failures**: Checks the health of EC2 instances and initiates corrective measures if needed.
- **Network Usage**: Tracks network activity to identify and mitigate bottlenecks.

## Terraform Backend Configuration

- **State Locking**: Prevents concurrent state modifications, reducing the risk of configuration conflicts.
- **State Security**: Ensures that state files are encrypted and stored securely, accessible only to authorized personnel.

## Terragrunt Usage

- **DRY Code Bases**: Utilizes a common configuration file to manage similar resources efficiently.
- **Remote State Management**: Handles state configuration automatically, minimizing manual setup and potential for errors.
- **Modular Dependencies**: Streamlines updates and management of dependencies between infrastructure modules.

## Project Structure

Each component of the infrastructure is modularized, allowing independent management and updates which simplifies the development lifecycle and enhances maintainability.

## How to Deploy

Navigate to the respective module directory and execute the following Terragrunt commands:
- `terragrunt plan`: Reviews proposed changes before application.
- `terragrunt run-all apply`: Deploys the changes to provision the infrastructure components.

## Conclusion

This setup demonstrates a robust solution for managing AWS infrastructure, highlighting best practices in automation, security, and scalability for DurianPay's DevOps initiatives.