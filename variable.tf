# This file defines the variables used in the Terraform configuration for AWS resources.
# It includes variables for VPC, subnets, security groups, EC2 instances, and S3 buckets.
variable "vpc_name" {
    description = "Name of the VPC"
    type        = string
    default     = "my-vpc"
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "pub_subnet_cidr" {
    description = "CIDR block for the public subnet"
    type        = string
    default     = "10.0.1.0/24"
}

variable "pvt_subnet_cidr" {
    description = "CIDR block for the private subnet"
    type        = string
    default     = "10.0.2.0/24"
}

variable "availability_zone" {
    description = "Availability zone for the subnets"
    type        = string
    default     = "eu-north-1a"
}

variable "route_cidr" {
    description = "CIDR block for the route table"
    type        = string
    default     = "0.0.0.0/0"
}

variable "security_group_name" {
    description = "Name of the security group"
    type        = string
    default     = "my-security-group"
}

variable "pub_subnet_name" {
    description = "Name of the public subnet"
    type        = string
    default     = "public-subnet"
}

variable "pvt_subnet_name" {
    description = "Name of the private subnet"
    type        = string
    default     = "private-subnet"
}

variable "aws_region" {
    description = "AWS region to deploy resources"
    type        = string
    default     = "eu-north-1"
}

variable "instance_name" {
    description = "Name of the EC2 instance"
    type        = string
    default     = "my-instance"
}

variable "instance_type" {
    description = "Type of the EC2 instance"
    type        = string
    default     = "t3.micro"
}

variable "project_name" {
    description = "Name of the project"
    type        = string
    default     = "my-project"
}

variable "environment" {
    description = "Environment for the resources (e.g., dev, prod)"
    type        = string
    default     = "dev"
}

variable "key_name" {
    description = "Name of the key pair for SSH access"
    type        = string
    default     = "new-key"
}

variable "ami" {
    description = "AMI ID for the EC2 instance"
    type        = string
    default     = "ami-0c1ac8a41498c1a9c" # Example AMI ID, replace with a valid one
}

variable "bucket_name" {
    description = "Name of the S3 bucket"
    type        = string
    default     = "my1-2unique-3bucket-4name" # Ensure this is globally unique
}

variable "bucket_region" {
    description = "Region for the S3 bucket"
    type        = string
    default     = "eu-north-1"
}

variable "bucket_key" {
    description = "Key for the S3 bucket object"
    type        = string
    default     = "my-object-key"
}
 
variable "aws_lb_name" {
  type        = string
  description = "Name of the load balancer"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the load balancer"
}

variable "aws_lb_listener_name" {
  type        = string
  description = "Name of the load balancer listener"
}

variable "aws_lb_target_group_name" {
  type        = string
  description = "Name of the target group"
}

variable "aws_lb_internal" {
  type        = bool
  description = "Whether the LB is internal"
}

variable "aws_lb_security_groups" {
  type        = list(string)
  description = "List of security groups for the LB"
}

variable "aws_lb_subnets" {
  type        = list(string)
  description = "List of subnets for the LB"
}



variable "min_size" {
    description = "Minimum size of the Auto Scaling group"
    type        = number
    default     = 1
}

variable "max_size" {
    description = "Maximum size of the Auto Scaling group"
    type        = number
    default     = 3
}

variable "desired_capacity" {
    description = "Desired capacity of the Auto Scaling group"
    type        = number
    default     = 2
}





