provider "aws" {
  region = "eu-west-2"   # Change to region you want to build infrastructure in
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}