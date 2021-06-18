variable "ami_id" {
  type        = string
  description = "ID Of the selected AWS AMI"
  default     = "ami-0eb471e022a0d8fc6"
}

variable "key_pair_name" {
  type        = string
  description = "Name of the SSH Key Pair"
}

variable "key_pair_value" {
  type        = string
  description = "Value of the public SSH Key Pair"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC for actions runner to be into. This is the VPC of the K8S cluster"
}

# variable "client_ip" {
#   type = string
#   description = "IP of the client to the GitHub Actions machine"
# }

# variable "region" {
#   type = string
#   description = "Region where the resources are going to be used"
#   default = "eu-central-1"
# }


# variable "state_bucket" {
#   type = string
#   description = "Name of the S3 bucket where the state is going to be stored"
# }
