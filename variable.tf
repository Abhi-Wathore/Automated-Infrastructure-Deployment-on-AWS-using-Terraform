# VPC Configuration

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
  description = "Availability zone to deploy subnets"
  type        = string
  default     = "eu-north-1a"
}

variable "route_cidr" {
  description = "CIDR for the default route (usually 0.0.0.0/0)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "security_group_name" {
  description = "Name of the default security group"
  type        = string
  default     = "my-security-group"
}

variable "pub_subnet_name" {
  description = "Name tag for public subnet"
  type        = string
  default     = "public-subnet"
}

variable "pvt_subnet_name" {
  description = "Name tag for private subnet"
  type        = string
  default     = "private-subnet"
}

# EC2/Instances Configuration

variable "aws_region" {
  description = "AWS region to deploy the infrastructure"
  type        = string
  default     = "eu-north-1"
}

variable "instance_name" {
  description = "Name tag for the EC2 instances"
  type        = string
  default     = "my-instance"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Project name tag for resources"
  type        = string
  default     = "my-project"
}

variable "environment" {
  description = "Environment tag (e.g. dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "key_name" {
  description = "SSH key pair name for EC2 access"
  type        = string
  default     = "new-key"
}

variable "ami" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0c1ac8a41498c1a9c" # Example AMI for eu-north-1
}

# S3 Configuration (used by EC2 module or others)

variable "bucket_name" {
  description = "S3 bucket name (must be globally unique)"
  type        = string
  default     = "my-unique-bucket-name-123"
}

variable "bucket_region" {
  description = "Region for the S3 bucket"
  type        = string
  default     = "eu-north-1"
}

variable "bucket_key" {
  description = "Object key for storing in the bucket"
  type        = string
  default     = "my-app-key"
}

# Load Balancer Configuration

variable "aws_lb_name" {
  description = "Name of the Load Balancer"
  type        = string
  default     = "my-lb"
}

variable "aws_lb_internal" {
  description = "Whether the Load Balancer is internal (true) or internet-facing (false)"
  type        = bool
  default     = false
}

variable "aws_lb_security_groups" {
  description = "List of security group IDs to associate with the Load Balancer"
  type        = list(string)
}

variable "aws_lb_subnets" {
  description = "List of subnet IDs for the Load Balancer"
  type        = list(string)
}

variable "aws_lb_target_group_name" {
  description = "Name of the target group attached to the Load Balancer"
  type        = string
  default     = "my-target-group"
}
variable "aws_lb_listener_name" {
  description = "Name of the Load Balancer listener"
  type        = string
  default     = "my-listener"
}

# Auto Scaling Group Configuration

variable "desired_capacity" {
  description = "Desired number of EC2 instances"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of EC2 instances"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of EC2 instances"
  type        = number
  default     = 4
}
