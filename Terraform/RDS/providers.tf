provider "aws" {
  region  = "ap-south-1"
  profile = "planitnerd"
}
terraform {
  backend "s3" {
    bucket        = "bysystem-tm"
    dynamodb_table = "terraform-state-locking"
    region        = "ap-south-1"
  }
}