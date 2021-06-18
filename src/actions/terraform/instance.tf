resource "aws_key_pair" "gh_actions_ssh_key" {
  key_name   = var.key_pair_name
  public_key = var.key_pair_value
}

resource "aws_instance" "gh_actions_instance" {
  ami             = var.ami_id
  instance_type   = "t2.medium"
  key_name        = aws_key_pair.gh_actions_ssh_key.key_name
  security_groups = ["${aws_security_group.gh_actions_sg.id}"]
  tags = {
    Name        = "Github Actions Instance"
    GithubRepo  = "gitlab_poc"
    GithubOrg   = "Design-and-Engineering"
    Environment = "development"
  }

  root_block_device {
    volume_size = 100
  }

  subnet_id = aws_subnet.subnet_gh_actions.id
}

resource "aws_eip" "gh_actions_eip" {
  instance = aws_instance.gh_actions_instance.id
  vpc      = true

  tags = {
    Name        = "Github Actions EIP"
    GithubRepo  = "gitlab_poc"
    GithubOrg   = "Design-and-Engineering"
    Environment = "development"
  }
}
