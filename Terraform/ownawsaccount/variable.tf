variable "ec2-name" {
  type    = list(any)
  default = ["stage-ec2", "prod-ec2"]
}