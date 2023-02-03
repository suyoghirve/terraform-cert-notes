provider "aws" {
  region  = "ap-south-1"
  profile = "planitnerd"
}
terraform {
  backend "s3" {
    bucket        = "bysystem-tm"
    region        = "ap-south-1"
  }
}