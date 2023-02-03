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

module "ec2module" {            # Any module name you can choose
  source = "../all-modules/"

}
