# gitlab_poc

## Setting up the infrastructure
This repo contains all the terraform scripts to spin up a EKS cluster with terraform.

When the cluster is created, the user who create the cluster will receive RBAC permissions as **master** of the cluster. In theory if you want to add more users as master you'd need to modify the `configMap` inside the cluster.
To avoid managing the aws_auth users, You can add/edit `variables.tf` you can read more about this [here](https://github.com/terraform-aws-modules/terraform-aws-eks/issues/1280#issuecomment-810533105)

As a quick note, make sure the IAM user register to the cluster have the necessary IAM policies (`iam:eks*`)

k
