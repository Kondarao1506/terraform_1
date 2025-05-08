terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.96.0"
    }
  }
backend "s3" {
    bucket = "aws-mystate-bucket"
    key    = "aws-remote-example"
    region = "us-east-1"
    dynamodb_table = "81s-locking-state"
  }

}

provider "aws" {
  # Configuration options
}


#aws-mystate-bucket ---> remote state
# locking --->81s-locking-state