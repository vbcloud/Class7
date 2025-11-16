# Provides internet communication between AWS VPC and the public internet

resource "aws_internet_gateway" "asg_template_igw_from_terraform" {
  vpc_id = aws_vpc.asg_template_vpc_from_terraform.id

  tags = {
    Name    = "office-hours-igw-from-terraform"
    Service = "Public connect"
    Owner   = "Vito"
    Planet  = "ZDR"
  }
}