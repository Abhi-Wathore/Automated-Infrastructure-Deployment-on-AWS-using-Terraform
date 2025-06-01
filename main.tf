# This is the main Terraform configuration file that sets up the AWS infrastructure.

terraform {
backend "s3" {
bucket = "abhi99-terraform"
key = "terraform.tfstate"
region = "eu-north-1"
}
}

module "vpc" {
    source = "./VPC"
    vpc_name = var.vpc_name
    vpc_cidr = var.vpc_cidr
    pub_subnet_cidr = var.pub_subnet_cidr
    pvt_subnet_cidr = var.pvt_subnet_cidr
    availability_zone = var.availability_zone
    route_cidr = var.route_cidr
    security_group_name = var.security_group_name
    pub_subnet_name = var.pub_subnet_name
    pvt_subnet_name = var.pvt_subnet_name
}

module "instances" {
    source = "./EC2_Instance"
    instance_name = var.instance_name
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    project_name = var.project_name
    environment = var.environment
    bucket_name = var.bucket_name
    bucket_key = var.bucket_key
    bucket_region = var.bucket_region
    aws_region = var.aws_region
}

module "load_balancer" {
    source = "./Load_Balancer"
    aws_lb_listener_name = var.aws_lb_listener_name
    aws_lb_target_group_name = var.aws_lb_target_group_name
    aws_lb_name = var.aws_lb_name
    aws_lb_internal = var.aws_lb_internal
    aws_lb_security_groups = var.aws_lb_security_groups
    aws_lb_subnets = var.aws_lb_subnets
}

module "auto_scaling" {
    source = "./Auto_Scaling"
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = module.vpc.public_subnet_id
    security_group_id = module.vpc.security_group_id
    instance_name = var.instance_name
    environment = var.environment
    project_name = var.project_name
    desired_capacity = var.desired_capacity
    min_size = var.min_size
    max_size = var.max_size
}