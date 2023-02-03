terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.51.0"
    }
  }
  backend "s3" {
    bucket        = "bysystem-tm"
    region        = "ap-south-1"
  }

}
provider "aws" {
  region  = "ap-south-1"
  profile = "planitnerd"
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
}