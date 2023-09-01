terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.12.0"
      # version = "2.43.0"
    }
  }
}


#provider "aws" {
#  # profile = "default"
#  shared_credentials_files = ["/home/keya/.aws/credentials"]
#  region  = "us-east-1"
#}
