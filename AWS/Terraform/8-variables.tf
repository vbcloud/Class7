variable "aws_region" {
  type = string
  description = "Default region of terraform configuration"
  default = "us-east-1"
}

variable "vpc_cidr_block" {
    type = string 
    description = "VPC Cidr Block Range"
    default = "10.80.0.0/16"
}

variable "subnet_cidr_block" {
    type = string 
    description = "Subnet Cidr Block Range"
    default = "10.80.26.0/24"
}

variable "subnet_az" {
  type = string
  description = "Subnet AZ"
  default = "us-east-1a"
}


variable "key_pair_name" {
  type = string
  description = "Name of key pair for SSH access"
  default = "class-7-key"
}

variable "security_group_name" {
  type = string
  description = "Security Group Name"
  default = "class-7-sg"
}

variable "instance_name" {
  type = string
  description = "Instance Name"
  default = "Name of Instance"
}