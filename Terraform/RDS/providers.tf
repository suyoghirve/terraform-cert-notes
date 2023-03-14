provider "aws" {
  region  = "us-east-1"
}
terraform {
  backend "s3" {
    bucket        = "terraform-suyog"
    key  = "state-lock"
    dynamodb_table = "state-locking"
    region        = "us-east-1"
  }
}