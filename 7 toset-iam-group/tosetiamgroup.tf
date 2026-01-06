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

# DevOps team usernames
variable "devops_usernames" {
  default = ["mdp", "mr", "kkkumar"]
}

resource "aws_iam_user" "devops_users" {
  for_each = toset(var.devops_usernames)
  name     = each.key
  tags = {
    Team = "Devops"
  }
}

# Production team usernames
variable "production_usernames" {
  default = ["KVR", "RVR", "YVK"]
}

resource "aws_iam_user" "production_users" {
  for_each = toset(var.production_usernames)
  name     = each.key
  tags = {
    Team = "Production"
  }
}
