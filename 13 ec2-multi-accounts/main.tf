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
  alias   = "dev"
  profile = "Devops_prassadh"
  region  = "us-northeast-1"
}

provider "aws" {
  alias   = "prod"
  profile = "aws-prassadh"
  region  = "ap-south-1"
}

resource "aws_instance" "dev_instance" {
    count = 2
  provider = aws.dev
  ami      = "ami-0fd3ac4abb734302a"
  instance_type = "t2.micro"
  tags = {
    Name = "dev-Instance-${count.index+1}"
  }
}

resource "aws_instance" "prod_instance" {
    count = 2
  provider = aws.prod
  ami      = "ami-0cf8ec67f4b13b491"
  instance_type = "t2.micro"
  tags = {
    Name = "prod-Instance-${count.index + 1}"
  }
}