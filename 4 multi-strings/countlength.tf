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


variable "instance-names" {
  default = ["dev", "stage", "prod"]
}

resource "aws_instance" "multistrings" {
  count         = length(var.instance-names)
  ami           = "ami-0cf8ec67f4b13b491"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance-names[count.index]
  }

}