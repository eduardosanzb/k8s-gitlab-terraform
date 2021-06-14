variable "region" {
  default     = "eu-central-1"
  description = "AWS region"
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::269365376725:user/gitlab_poc_principal"
      username = "gitlab_poc_principal"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::269365376725:user/Santos_Ricardo"
      username = "Santos_Ricardo"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::269365376725:user/Bautista_Eduardo"
      username = "Bautista_Eduardo"
      groups   = ["system:masters"]
    },
  ]
}
