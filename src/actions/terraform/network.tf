data "aws_vpc" "gitlab_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

resource "aws_subnet" "subnet_gh_actions" {
  cidr_block        = cidrsubnet(data.aws_vpc.gitlab_vpc.cidr_block, 3, 1)
  vpc_id            = data.aws_vpc.gitlab_vpc.id
  availability_zone = "eu-central-1a"

  tags = {
    Name        = "Github Actions Subnet"
    GithubRepo  = "gitlab_poc"
    GithubOrg   = "Design-and-Engineering"
    Environment = "development"
  }
}

resource "aws_security_group" "gh_actions_sg" {
  name   = "gh_actions_sg"
  vpc_id = data.aws_vpc.gitlab_vpc.id

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "Github Actions SG"
    GithubRepo  = "gitlab_poc"
    GithubOrg   = "Design-and-Engineering"
    Environment = "development"
  }
}

data "aws_internet_gateway" "vpc_gw" {
  filter {
    name = "tag:Name"
    values = [var.vpc_name]
  }
}

resource "aws_route_table" "gh_actions_route_table" {
  vpc_id = data.aws_vpc.gitlab_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.vpc_gw.id
  }
  tags = {
    Name        = "Github Actions Route Table"
    GithubRepo  = "gitlab_poc"
    GithubOrg   = "Design-and-Engineering"
    Environment = "development"
  }
}

resource "aws_route_table_association" "subnet_association" {
  subnet_id      = aws_subnet.subnet_gh_actions.id
  route_table_id = aws_route_table.gh_actions_route_table.id
}
