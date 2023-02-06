
resource "aws_instance" "web2" {
  ami           = "ami-0cca134ec43cf708f"
  instance_type = "t2.large"
  tags = {
    Name = "terraform-module"
  }     
}
