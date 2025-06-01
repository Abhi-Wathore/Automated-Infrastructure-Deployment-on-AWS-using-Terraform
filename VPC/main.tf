resource "aws_vpc" "mainvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id                  = aws_vpc.mainvpc.id
  cidr_block              = var.pub_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone
  tags = {
    Name = var.pub_subnet_name
  }
}

resource "aws_subnet" "pvt_subnet" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = var.pvt_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = var.pvt_subnet_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mainvpc.id
}

resource "aws_route_table" "myroute" {
  vpc_id = aws_vpc.mainvpc.id

  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "pub_subnet_assoc" {
  subnet_id      = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.myroute.id
}

resource "aws_route_table_association" "pvt_subnet_assoc" {
  subnet_id      = aws_subnet.pvt_subnet.id
  route_table_id = aws_route_table.myroute.id
}

# Option 1: Referencing existing security group by name
data "aws_security_group" "mysg" {
  name   = var.security_group_name
  vpc_id = aws_vpc.mainvpc.id
}

# OR

# Option 2: Create a new security group instead
# resource "aws_security_group" "mysg" {
#   name        = var.security_group_name
#   description = "Allow web traffic"
#   vpc_id      = aws_vpc.mainvpc.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = var.security_group_name
#   }
# }
