# Application Load Balancer that will route traffic to our ASG instances

resource "aws_lb" "asg-template-alb" {
  name               = "asg-template-alb"
  internal           = false                            # Internal must be set to false to be internet facing
  load_balancer_type = "application"                    # Type must be set to application 
  security_groups    = [aws_security_group.asg-template-sg2LB01.id]  # Load balancer security group must be used here
  subnets = [
    aws_subnet.public-eu-west-2a.id,
    aws_subnet.public-eu-west-2b.id,
    aws_subnet.public-eu-west-2c.id
  ]                                                                  # Load balancer must be used in public subnets to be internet facing
  enable_deletion_protection = false
  #Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "asg-template-alb"
    Service = "Load Balancing"
    Owner   = "Vito"
    Project = "Demo for Office hours"
  }
}


# Application Load Balancer listening on port 80 to forward traffic to target group
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.asg-template-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg-template-tg01.arn
  }
}








# These resources are to be used with port 443 (HTTPS). For this example using HTTP on port 80, these aren't needed.


# data "aws_acm_certificate" "cert" {
#   domain   = "balerica-aisecops.com"
#   statuses = ["ISSUED"]
#   most_recent = true
# }


# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.app1_alb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
#   certificate_arn   = data.aws_acm_certificate.cert.arn



#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.app1_tg.arn
#   }
# }

# output "lb_dns_name" {
#   value       = aws_lb.app1_alb.dns_name
#   description = "The DNS name of the App1 Load Balancer."
# }