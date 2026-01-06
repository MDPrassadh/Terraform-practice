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
variable "azs" {
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

}
resource "aws_subnet" "multi_subnets" {
  count             = length(var.azs)
  vpc_id            = "vpc-06ef3d12180c3a531"
  cidr_block        = cidrsubnet("10.0.0.0/16", 6, count.index)
  availability_zone = var.azs[count.index]

}