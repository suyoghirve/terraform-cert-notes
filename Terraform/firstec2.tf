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
  region  = "ap-south-1"
  profile = "planitnerd"
}

terraform {
  cloud {
    organization = "suyoghirve-org"
    workspaces {
      name = "test-workspace"
    }
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
  ami           = "ami-0cca134ec43cf708f"
  instance_type = "t3.micro"
  count         = 2
  tags = {
    #Name = "HelloWorld-renew.${count.index}"  # this will create 3 ec2 with same name
    Name = var.ec2-name[count.index] #ec2 instancw will create by name dev, stage & prod
  }
}
