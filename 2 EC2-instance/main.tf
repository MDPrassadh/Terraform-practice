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
  region  = "ap-south-2"
  profile = "default"

}

resource "aws_instance" "dev" {
  ami               = "ami-0e7938ad51d883574"
  instance_type     = "t3.small"
  availability_zone = "ap-south-2a"
  tags = {
    Name        = "tf-1"
    environment = "prod"
  }
}


resource "aws_instance" "prod" {
  ami               = "ami-0e7938ad51d883574"
  instance_type     = "t3.medium"
  availability_zone = "ap-south-2b"
  tags = {
    Name        = "tf-2"
    environment = "production"
  }
}
