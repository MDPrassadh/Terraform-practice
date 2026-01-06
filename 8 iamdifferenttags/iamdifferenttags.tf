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

variable "users_map" {
  default = {
    mdp = "dev"
    gbr = "qa"
    kvb = "infra"
  }
}

resource "aws_iam_user" "department_user" {
  
  for_each = var.users_map
  name     = each.key
  tags = {
    Department = each.value
    created_by = "terraform"
  }
}