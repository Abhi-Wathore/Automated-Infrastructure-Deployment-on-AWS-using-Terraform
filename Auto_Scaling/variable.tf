variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "subnet_id" {}
variable "security_group_id" {}
variable "instance_name" {}
variable "environment" {}
variable "project_name" {}

variable "desired_capacity" {
  default = 2
}

variable "min_size" {
  default = 1
}

variable "max_size" {
  default = 4
}
