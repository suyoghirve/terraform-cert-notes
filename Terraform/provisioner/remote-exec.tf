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

resource "aws_instance" "web2" {
  ami           = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"
  key_name = "ownkey"
  tags = {
    Name = "terraform-provisioner"
  }
    
    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./ownkey")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl start nginx"
    ]
  }
}
