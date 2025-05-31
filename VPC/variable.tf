# This file contains the variables used in the VPC module.
# It defines the variables for the VPC module, including the region, CIDR block, and tags.
# These variables are used to create the VPC and its associated resources.
# The variables are defined with default values, but you can override them when you call the module.

variable "vpc_name" {}

variable "vpc_cidr" {}

variable "pub_subnet_cidr" {}

variable "pvt_subnet_cidr" {}

variable "availability_zone" {}

variable "route_cidr" {}

variable "security_group_name" {}

variable "pub_subnet_name" {}

variable "pvt_subnet_name" {}