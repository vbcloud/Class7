resource "aws_security_group" "class-7-sg" {
  name = var.security_group_name
  description = "Allow Port 80 and Port 22"
  vpc_id = aws_vpc.class-7-vpc.id 

ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
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
    Name    = "class-7-sg"
    Service = "terraform"
  }
}