terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }
  
  backend "s3" {
    bucket        = "terraform-suyog"
    region        = "us-east-1"
  }

}

provider "aws" {
  region = "us-east-1"
}