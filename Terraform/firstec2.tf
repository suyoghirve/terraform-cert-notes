terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.51.0"
    }
    github = {
      source  = "integrations/github"
      version = "5.15.0"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "15.8.0"
    }
  }

}
provider "aws" {
  region  = "us-east-1"
  profile = "devops"
}

terraform {
  backend "s3" {
    bucket = "terraform-suyog"
    region = "us-east-1"
  }
}
/*
resource "aws_s3_bucket" "bysystem-tm" {
  bucket = "bysystem-tm"
}
*/
/*
resource "aws_s3_bucket_versioning" "bysystem-tm" {
  bucket = aws_s3_bucket.bysystem-tm.id

  versioning_configuration {
    status = "Enabled"
  }
}
*/

resource "aws_instance" "web2" {
  ami           = "ami-0dfcb1ef8550277af"
  instance_type = "t3.micro"
  count         = 2
  tags = {
    #Name = "HelloWorld-renew.${count.index}"  # this will create 3 ec2 with same name
    Name = var.ec2-name[count.index] #ec2 instancw will create by name dev, stage & prod
  }
}
