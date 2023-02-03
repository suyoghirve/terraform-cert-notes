provider "aws" {
  region  = "ap-south-1"
  profile = "planitnerd"
}
terraform {
  backend "s3" {
    bucket        = "bysystem-tm"
    key = "s3file.tfstate"
    region        = "ap-south-1"
  }
}