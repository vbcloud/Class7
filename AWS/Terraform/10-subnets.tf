# These are public subnets

resource "aws_subnet" "public-eu-west-2a" {
  vpc_id                  = aws_vpc.asg_template_vpc_from_terraform.id
  cidr_block              = "10.80.6.0/24"    # Subnet CIDR Block subnet mask (number after forward slash) needs to be smaller than VPC subnet mask
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true              # This determines whether a subnet is public or private. Change this to false if you want your subnet to be private/

  tags = {
    Name    = "public-eu-west-2a"
    Service = "Subnetwork"
    Owner   = "Vito"
    Planet  = "ZDR"
  }
}

resource "aws_subnet" "public-eu-west-2b" {
  vpc_id                  = aws_vpc.asg_template_vpc_from_terraform.id
  cidr_block              = "10.80.7.0/24"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-2b"
    Service = "Subnetwork"
    Owner   = "Nick"
    Planet  = "ZDR"
  }
}


resource "aws_subnet" "public-eu-west-2c" {
  vpc_id                  = aws_vpc.asg_template_vpc_from_terraform.id
  cidr_block              = "10.80.8.0/24"
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-eu-west-2c"
    Service = "Subnetwork"
    Owner   = "Nick"
    Planet  = "ZDR"
  }
}

# These are private subnets
resource "aws_subnet" "private-eu-west-2a" {
  vpc_id            = aws_vpc.asg_template_vpc_from_terraform.id
  cidr_block        = "10.80.26.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name    = "private-eu-west-2a"
    Service = "Subnetwork"
    Owner   = "Nick"
    Planet  = "ZDR"
  }
}

resource "aws_subnet" "private-eu-west-2b" {
  vpc_id            = aws_vpc.asg_template_vpc_from_terraform.id
  cidr_block        = "10.80.27.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name    = "private-eu-west-2b"
    Service = "Subnetwork"
    Owner   = "Nick"
    Planet  = "ZDR"
  }
}


resource "aws_subnet" "private-eu-west-2c" {
  vpc_id            = aws_vpc.asg_template_vpc_from_terraform.id
  cidr_block        = "10.80.28.0/24"
  availability_zone = "eu-west-2c"

  tags = {
    Name    = "private-eu-west-2c"
    Service = "Subnetwork"
    Owner   = "Nick"
    Planet  = "ZDR"
  }
}