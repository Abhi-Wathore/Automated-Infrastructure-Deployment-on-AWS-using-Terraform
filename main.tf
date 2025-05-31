# This is the main Terraform configuration file that sets up the AWS infrastructure.

terraform {
backend "s3" {
bucket = "abhi99-terraform"
key = "terraform.tfstate"
region = "eu-north-1"
}
}

module "instances" {
    source = "./EC2_Instance"
    instance_name = var.instance_name
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    bucket_name = var.bucket_name
    bucket_key = var.bucket_key
    bucket_region = var.bucket_region
    aws_region = var.aws_region
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
    auto_scaling_group_name = var.auto_scaling_group_name
    launch_template_name = var.launch_template_name
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_capacity
    vpc_zone_identifier = var.vpc_zone_identifier
    target_group_arns = var.target_group_arns
  
}