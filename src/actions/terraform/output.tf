output "gh_actions_instance_ip" {
    type = string
    description = "IP Address of the EC2 instance"
    value = aws_eip.gh_actions_eip.address
}

output "gh_actions_instance_id" {
    type = string
    description = "Name of the EC2 instance"
    value = aws_instance.gh_actions_instance.id
}

output "gh_actions_sg_ingress" {
    description = "Security group ingress rules"
    value = aws_security_group.gh_actions_sg.ingress
}
