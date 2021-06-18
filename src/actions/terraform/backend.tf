terraform {
  backend "s3" {
    bucket = "tf-gitlab-remote-state"
    key    = "gh_actions/terraform.tfstate"
    region = "eu-central-1"
  }

  # backend "local" {
    # bucket = var.bucket
    # key    = "layer1/infrastructure.tfstate"
    # region = var.region
    # path = "./ec2/terraform.tfstate"
  # }
}
