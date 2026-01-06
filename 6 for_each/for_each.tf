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
  profile = "default"
}

resource "aws_iam_user" "prod_users" {
  for_each = toset(["MDP", "GBR", "ssk"])
  name     = each.key

}