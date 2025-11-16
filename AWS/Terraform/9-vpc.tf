# this  makes  vpc.id which is aws_vpc.app1.id
resource "aws_vpc" "asg_template_vpc_from_terraform" {
  cidr_block           = "10.80.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "asg-template-vpc-from-terraform"
    Service = "Network"
    Owner   = "Vito"
    Planet  = "ZDR"
  }
}