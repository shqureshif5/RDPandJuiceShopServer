################################
## AWS Provider Module - Main ##
################################

# AWS Provider
#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "~> 3.0"
#    }
#  }
#}

provider "aws" {
  #  access_key = var.aws_access_key
  #  secret_key = var.aws_secret_key
  shared_credentials_files = ["~/.aws/credentials"]
#  profile                  = "Default"
  region = var.aws_region
}

