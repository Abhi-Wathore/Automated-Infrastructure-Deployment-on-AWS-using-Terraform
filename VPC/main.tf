resource "aws_vpc" "mainvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
    # The VPC is created with the CIDR block defined in the variable vpc_cidr
  
}
resource "aws_subnet" "pub-subnet" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.pub_subnet_cidr
  map_public_ip_on_launch = true
    availability_zone = var.availability_zone
    tags = {
      Name = var.pub_subnet_name
    }
    # The map_public_ip_on_launch attribute is set to true to assign public IPs to instances in this subnet
}

resource "aws_subnet" "pvt-subnet" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.pvt_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = var.pvt_subnet_name
  }
    # The private subnet does not have the map_public_ip_on_launch attribute set, so instances in this subnet will not receive public IPs
  
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mainvpc.id
    # The internet gateway allows communication between instances in the VPC and the internet
}

resource "aws_route_table_association" "pub-subnet-assoc" {
  subnet_id      = aws_subnet.pub-subnet.id
  route_table_id = aws_route_table.myroute.id
    # This associates the public subnet with the route table
}
resource "aws_route_table_association" "pvt-subnet-assoc" {
  subnet_id      = aws_subnet.pvt-subnet.id
  route_table_id = aws_route_table.myroute.id
    # This associates the private subnet with the route table
    # The private subnet does not have a route to the internet, so instances in this subnet will not be able to access the internet directly
    # You may want to add a NAT gateway for instances in the private subnet to access the internet
}

resource "aws_route_table" "myroute" {
  vpc_id = aws_vpc.mainvpc.id
  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.igw.id
    # The route_cidr variable should be defined in your variables.tf file
}
}

data "aws_security_group" "mysg" {
  vpc_id = aws_vpc.mainvpc.id  
}