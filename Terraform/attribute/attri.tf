terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.51.0"
    }

  }
  cloud {
    organization = "suyoghirve-org"  
    hostname     = "app.terraform.io"
    workspaces {
      name = "test-workspace"
    }
    token = "2gftsBoloWEPeg.atlasv1.BEHu8du87th91VUOJbWtq2e8Mb6al9EG9YIaxGlN3u0X2VG18fZWnFY6sOiHzth7JlM"
  }

}
provider "aws" {
  region     = "ap-south-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
resource "aws_eip" "lb" {
  vpc = true
}

output "eip" {
  value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "terraform-attribute-planitnerd-001"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}

