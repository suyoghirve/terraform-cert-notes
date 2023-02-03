provider "github" {
  token = var.token #token is saved in terraform.tfvars file in the path
}
resource "github_repository" "example_from_terraform" {
  name        = "example_from_terraform"
  description = "My awesome web page"
  visibility  = "private"
}
provider "gitlab" {
  token = var.gitlab_token #token is saved in terraform.tfvars file in the path
  
}

# Add a project owned by the user
resource "gitlab_project" "sample_project_terrform" {
  name = "terraform_example"
}