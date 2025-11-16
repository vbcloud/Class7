data "aws_ami" "amzn-linux-2023-ami" {  # Data source for most recent Amazon Linux 2023 AMI. This is so you don't have to hardcode the value every time you switch regions.
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_launch_template" "asg-template-LT01" {  # Launch template that will be used with the autoscaling group
  name_prefix   = "asg-template-LT01"
  image_id      = data.aws_ami.amzn-linux-2023-ami.id
  instance_type = "t3.micro"                          # Instance type that will be used in autoscaling group

  vpc_security_group_ids = [aws_security_group.asg-template-tgsg01.id]    # Security group to be used with launch template

  user_data = filebase64("./startup.sh")  # User data argument where file path to startup script will be read and encoded in base64

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "asg-template-asg-instance"
      Service = "Auto Scaling"
      Owner   = "Vito"
      Planet  = "ZDR"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}




# Unused instance block, feel free to ignore

# resource "aws_instance" "asg-template-instance-from-terraform" {
#   ami                    = data.aws_ami.amzn-linux-2023-ami.id
#   instance_type          = "t3.micro"
#   subnet_id              = aws_subnet.public-eu-west-1a.id
#   vpc_security_group_ids = [aws_security_group.asg-template-sg01.id]
#   user_data              = file("./startup.sh")

#   tags = {
#     Name = "asg-template-instance-from-terraform"
#   }
# }


# output "asg-template-instance-ip" {
#   value = aws_instance.asg-template-instance-from-terraform.public_ip
# }

# output "asg-template-instance-public-dns" {
#   value = aws_instance.asg-template-instance-from-terraform.public_dns
# }