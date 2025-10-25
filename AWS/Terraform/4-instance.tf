resource "tls_private_key" "class-7-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "class-7-key" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.class-7-key.public_key_openssh
}

output "class-7-key" {
  value     = tls_private_key.class-7-key.private_key_pem
  sensitive = true
}


resource "aws_instance" "class-7-instance-from-terraform" {
  ami = "ami-08982f1c5bf93d976"
  instance_type = "t3.micro"
  availability_zone = var.subnet_az
  subnet_id = aws_subnet.class-7-subnet.id 
  key_name = var.key_pair_name
  user_data = file("./startup.sh")
  vpc_security_group_ids = [aws_security_group.class-7-sg.id]
  tags = {
    Name = "class-7-instance"
    Service = "terraform"
    Subnet = "class-7-subnet"
  }
  lifecycle {
    create_before_destroy = true 
  }
}