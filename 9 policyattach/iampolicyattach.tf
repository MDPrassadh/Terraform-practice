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

resource "aws_iam_user_policy_attachment" "attach_policies" {
  for_each = {
    mdp = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    gbr = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    kvb = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
  }
  user       = each.key
  policy_arn = each.value
}


# these are alternative ways to attach policies to users.

/* resource "aws_iam_user_policy_attachment" "attach_policies" {
    for_each    = toset(["mdp", "gbr"])
    user        = each.key
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  
}

resource "aws_iam_user_policy_attachment" "attach_policy" {
    for_each    = toset(["kvb"])
    user        = each.key
    policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"

} */
