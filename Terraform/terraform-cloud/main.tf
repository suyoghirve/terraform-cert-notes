terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.51.0"
    }
  }
  cloud {
    organization = "suyoghirve-org"

    workspaces {
      name = "Terraform"
    }
  }

}

provider "aws" {
  region     = "ap-south-1"
 # access_key = var.aws_access_key   Add these Access/ Secret Access Keys in Terraform Cloud Workspace as env variable.
  #secret_key = var.aws_secret_key
}
resource "aws_instance" "web2" {
  ami           = "ami-0cca134ec43cf708f"
  instance_type = "t2.micro"

}
