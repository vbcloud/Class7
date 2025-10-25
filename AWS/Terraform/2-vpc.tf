resource "aws_vpc" "class-7-vpc" {
  cidr_block = var.vpc_cidr_block
    tags = {
    Name = "class-7-vpc"
    Service = "terraform"
  }
}

resource "aws_subnet" "class-7-subnet" {
  vpc_id = aws_vpc.class-7-vpc.id  
  cidr_block = var.subnet_cidr_block
  availability_zone = var.subnet_az
  map_public_ip_on_launch = true 
 tags = {
    Name = "class-7-subnet"
    Service = "terraform"
    VPC = "class-7-vpc"
  }
}


resource "aws_internet_gateway" "class-7-igw" {
vpc_id = aws_vpc.class-7-vpc.id 
tags = {
    Name = "class-7-subnet"
    Service = "terraform"
    VPC = "class-7-vpc"
  }
}


resource "aws_route_table" "class-7-public-rtb" {
vpc_id   = aws_vpc.class-7-vpc.id 
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.class-7-igw.id 
  }
tags = {
    Name = "class-7-subnet"
    Service = "terraform"
    VPC = "class-7-vpc"
  }
}

resource "aws_route_table_association" "class-7-rtb-association" {
  subnet_id = aws_subnet.class-7-subnet.id
  route_table_id = aws_route_table.class-7-public-rtb.id 
}