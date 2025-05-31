# This file contains the output values for the EC2_Instance module.
# and are useful for debugging or for use in other parts of your infrastructure.
#These are values extracted from your resources


output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.web.public_ip
}

output "instance_ami" {
  description = "The AMI used for the instance"
  value       = aws_instance.web.ami
}

output "instance_type" {
  description = "The instance type of the instance"
  value       = aws_instance.web.instance_type
}

output "instance_state" {
  description = "The state of the instance"
  value       = aws_instance.web.instance_state
}
