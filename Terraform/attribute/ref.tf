resource "aws_instance" "web2" {
  ami           = "ami-0cca134ec43cf708f"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld-renew"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web2.id
  allocation_id = aws_eip.lb.id
}
resource "aws_security_group" "terraform-launch-wizard" {
  name        = "terraform-launch-wizard"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]

  }
}
