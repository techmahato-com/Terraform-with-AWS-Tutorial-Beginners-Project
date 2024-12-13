terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
}
# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}