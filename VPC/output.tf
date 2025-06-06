
#This file contains the output values for the VPC module.
# This file is used to expose key attributes of the VPC and its related resources to other modules or to the root module. 
# It includes outputs for VPC ID, subnet IDs, CIDR blocks, route table ID, internet gateway ID, and security group ID.
output "vpc_id" {
description = "The ID of the VPC"
value = aws_vpc.mainvpc.id
}

output "public_subnet_ids" {
description = "List of public subnet IDs"
value = aws_subnet.pub_subnet[*].id
}

output "private_subnet_ids" {
description = "List of private subnet IDs"
value = aws_subnet.pvt_subnet[*].id
}

output "vpc_cidr_block" {
description = "CIDR block of the VPC"
value = aws_vpc.mainvpc.cidr_block
}

output "public_route_table_id" {
description = "ID of the public route table"
value = aws_route_table.myroute.id
}

output "internet_gateway_id" {
description = "ID of the Internet Gateway"
value = aws_internet_gateway.igw.id
}

output "security_group_id" {
description = "ID of the default security group"
value = data.aws_security_group.mysg.id
}

# If you want to output a specific public subnet ID, ensure the resource exists and is named correctly.
# Otherwise, you can remove this output if not needed, or output all public subnet IDs as above.
# Example for a specific subnet:
output "pub_subnet_id" {
   value = aws_subnet.pub_subnet[0].id
 }
