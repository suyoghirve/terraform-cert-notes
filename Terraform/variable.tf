variable "token" {
  type = string
}

variable "gitlab_token" {
  type = string
}

variable "ec2-name" {
  type    = list(any)
  default = ["dev-ec2", "stage-ec2", "prod-ec2"]
}