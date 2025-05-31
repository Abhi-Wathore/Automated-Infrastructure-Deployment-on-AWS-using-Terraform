variable "aws_region" {
  default = "eu-north-1"
}

variable "public_key_path" {
  description = "Path to SSH public key"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID"
}
