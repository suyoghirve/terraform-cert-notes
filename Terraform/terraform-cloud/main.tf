terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.51.0"
    }
  }

}
provider "aws" {}

terraform {
  cloud {
    organization = "suyoghirve-org"

    workspaces {
      name = "Terraform"
    }
  }
}

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
  instance_type = lookup(var.instance_type, terraform.workspace)

}
variable "instance_type" {
  type = map(string)
  default = {
    default  = "t2.nano"
    dev-test = "t2-micro"
    prod     = "t2.large"
  }
}