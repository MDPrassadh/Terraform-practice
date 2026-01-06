terraform {
  required_version = ">1.3.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }
}
provider "aws" {
  region  = "ap-south-1"
  profile = "Devops_prassadh"
}



resource "aws_instance" "CountParameterInstance" {
  count             = 1
  ami               = "ami-0cf8ec67f4b13b491"
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1b"
  security_groups   = ["default"]

  tags = {
    Name = "prod-server${count.index + 1}"
    env  = "production"
  }
}
