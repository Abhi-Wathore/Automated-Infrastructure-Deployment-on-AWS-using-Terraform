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
