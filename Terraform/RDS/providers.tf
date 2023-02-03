provider "aws" {
  region  = "ap-south-1"
  profile = "planitnerd"
}
terraform {
  backend "s3" {
    bucket        = "bysystem-tm"
    key  = "demo.tfstate"
    dynamodb_table = "terraform_statelocking"
    region        = "ap-south-1"
  }
}