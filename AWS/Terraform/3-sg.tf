# Security group for Instances

resource "aws_security_group" "asg-template-tgsg01" {
  name        = "asg-template-tgsg01"
  description = "allow port 80"
  vpc_id      = aws_vpc.asg_template_vpc_from_terraform.id

  ingress {                               # Inbound rules go in ingress, example shown here is port 80
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {                                # Outbound rules go in egress
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "office-hours-sg01"
    Service = "office-hours-instance"
    Owner   = "Vito"
    Planet  = "ZDR"
  }
}





resource "aws_security_group" "asg-template-sg2LB01" {
  name        = "asg-template-sg2LB01"
  description = "asg-template-sg2LB01"
  vpc_id      = aws_vpc.asg_template_vpc_from_terraform.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "office-hours-sg02-LB01"
    Service = "Load Balancing"
    Owner   = "Nick"
    Planet  = "ZDR"
  }

}