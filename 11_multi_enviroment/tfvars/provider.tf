terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.96.0"
    }
  }
backend "s3" {

    }
}

provider "aws" {
  # Configuration options
}


#aws-mystate-bucket ---> remote state
# locking --->81s-locking-state