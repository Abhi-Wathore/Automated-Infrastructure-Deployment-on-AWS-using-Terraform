# This file contains the variables used in the EC2_Instance module.
# It defines the variables for the EC2 instance, including the region, instance type, AMI, and tags.
# These variables are used to create the EC2 instance and its associated resources.

variable "aws_region" {}

variable "instance_name" {}

variable "instance_type" {}

variable "key_name" {}

variable "ami" {}

variable "bucket_name" {}

variable "bucket_region" {}

variable "bucket_key" {}