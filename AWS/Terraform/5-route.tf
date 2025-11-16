# Public Route Table


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.asg_template_vpc_from_terraform.id
  tags   = { Name = "public" }
}

# Default IPv4 destination route for public route table
resource "aws_route" "public_default" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.asg_template_igw_from_terraform.id
}

# Public Route table associations for public subnets. If you do not have the public subnets associated with the corresponding route table, traffic will not be routed properly.

resource "aws_route_table_association" "public-eu-west-2a" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public-eu-west-2a.id
}

resource "aws_route_table_association" "public-eu-west-2b" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public-eu-west-2b.id
}

resource "aws_route_table_association" "public-eu-west-2c" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public-eu-west-2c.id
}


# Private Route Table


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.asg_template_vpc_from_terraform.id
  tags   = { Name = "private" }
}

# Default IPv4 destination route for private route table

resource "aws_route" "private_default" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.asg_template_nat_gateway.id
}

# Private Route table associations for private subnets. If you do not have the private subnets associated with the corresponding route table, traffic will not be routed properly.

resource "aws_route_table_association" "private-eu-west-2a" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private-eu-west-2a.id
}

resource "aws_route_table_association" "private-eu-west-2b" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private-eu-west-2b.id
}

resource "aws_route_table_association" "private-eu-west-2c" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private-eu-west-2c.id
}