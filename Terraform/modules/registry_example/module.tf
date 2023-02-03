module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-0cca134ec43cf708f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-034385a5e5ea42ef3"]
  subnet_id              = "subnet-20b78848"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install nginx1 -y",
      "sudo systemctl start nginx"
    ]
  }
}