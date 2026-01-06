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
  region  = "us-east-1"
}

provider "aws" {
  alias   = "prod"
  profile = "aws-prassadh"
  region  = "ap-south-1"
}

resource "aws_s3_bucket" "dev_bucket" {
  provider = aws.dev
  bucket   = "prassadh"
}

resource "aws_s3_bucket" "prod_bucket" {
  provider = aws.prod
  bucket   = "aws-yashu"
}

