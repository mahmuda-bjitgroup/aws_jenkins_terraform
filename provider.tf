terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.74.2"
      # version = "2.43.0"
    }
  }
}


provider "aws" {
  # profile = "default"
  shared_credentials_file = ["~/.aws/credentials"]
  region  = "us-east-1"
}
