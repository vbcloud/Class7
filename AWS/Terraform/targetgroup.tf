# Target group for ASG that is operating on port 80

resource "aws_lb_target_group" "asg-template-tg01" {
  name        = "asg-template-tg01"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.asg_template_vpc_from_terraform.id
  target_type = "instance"        # Target type MUST be instance in order to be associated with the autoscaling group

  health_check {                  # Health check will check in the specified interval to see if targets are healthy
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "asg-template-tg01"
    Service = "TG for ASG"
    Owner   = "Nick"
  }
}