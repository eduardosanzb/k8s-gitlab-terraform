terraform {
  backend "s3" {
    bucket = "tf-gitlab-remote-state"
    key    = "gh_actions/terraform.tfstate"
    region = "eu-central-1"
  }
}
