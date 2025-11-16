# Outputs load balancer DNS so you don't need to retrieve it from the console or the Terraform state file
output "lb-dns" {
  value = aws_lb.asg-template-alb.dns_name
}