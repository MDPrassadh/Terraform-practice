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
  alias  = "northvirginia"
  region = "us-east-1"
}
provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

resource "aws_instance" "north" {
  count         = 2
  provider      = aws.northvirginia
  ami           = "ami-0fd3ac4abb734302a"
  instance_type = "t2.micro"
  tags = {
    Name = "prod-Instance-${count.index + 1}"
  } 
}

resource "aws_instance" "mumbai" {
  count         = 2
  provider      = aws.mumbai
  ami           = "ami-0cf8ec67f4b13b491"
  instance_type = "t2.micro"
  tags = {
    Name = "qa-Instance-${count.index + 1}"
  } 
}