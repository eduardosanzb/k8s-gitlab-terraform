terraform {
  backend "s3" {
    bucket = "tf-gitlab-remote-state"
    key    = "gitlab_eks/terraform.tfstate"
    region = "eu-central-1"
  }
}
