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

resource "aws_eip" "lb" {
  vpc      = true
  depends_on = [null_resource.health_check]
}


resource "null_resource" "health_check" {

 provisioner "local-exec" {

    command = "curl https://google.com"
  }
}
