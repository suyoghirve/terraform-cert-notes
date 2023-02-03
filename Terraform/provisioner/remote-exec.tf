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
  ami           = "ami-0cca134ec43cf708f"
  instance_type = "t3.micro"
  key_name = "terraform-key"
  tags = {
    Name = "terraform-provisioner"
  }
    
    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./terraform-key.pem")
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
