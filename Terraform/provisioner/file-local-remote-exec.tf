terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.51.0"
    }
  }
  backend "s3" {
    bucket        = "terraform-suyog"
    region        = "us-east-1"
  }

}
provider "aws" {
  region  = "us-east-1"
}

resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-05c9a0905597d37d9"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "web2" {
  ami           = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"
  key_name = "ownkey"
  security_groups = ["allow_ssh_http"]
  /*provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }*/
  /*tags = {
    Name = "terraform-provisioner"
  }
  tags = {
    Name = "allow_sshnew"
  }*/
  provisioner "file" {
      content = file("./ownkey.pem")
      destination = "/home/ec2-user/ownkey.pem"
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("ownkey.pem")
    host     = self.public_ip
  }

  /*provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "echo ${self.private_ip} >> /home/ec2-user/private_ips.txt"
    ]
  }*/
}
output "public_ip"{
  value = aws_instance.web2.public_ip
}