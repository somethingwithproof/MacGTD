terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Dedicated Host for Mac instances (24hr minimum)
resource "aws_ec2_host" "mac_host" {
  instance_type     = var.mac_instance_type
  availability_zone = var.availability_zone
  auto_placement    = "on"
  host_recovery     = "off"

  tags = {
    Name    = "macgtd-e2e-runner"
    Project = "MacGTD"
  }
}

# VPC
resource "aws_vpc" "runner_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "macgtd-runner-vpc"
  }
}

resource "aws_subnet" "runner_subnet" {
  vpc_id                  = aws_vpc.runner_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "macgtd-runner-subnet"
  }
}

resource "aws_internet_gateway" "runner_igw" {
  vpc_id = aws_vpc.runner_vpc.id

  tags = {
    Name = "macgtd-runner-igw"
  }
}

resource "aws_route_table" "runner_rt" {
  vpc_id = aws_vpc.runner_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.runner_igw.id
  }

  tags = {
    Name = "macgtd-runner-rt"
  }
}

resource "aws_route_table_association" "runner_rta" {
  subnet_id      = aws_subnet.runner_subnet.id
  route_table_id = aws_route_table.runner_rt.id
}

# Security Group - SSH + VNC
resource "aws_security_group" "runner_sg" {
  name_prefix = "macgtd-runner-"
  vpc_id      = aws_vpc.runner_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  ingress {
    description = "VNC"
    from_port   = 5900
    to_port     = 5900
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "macgtd-runner-sg"
  }
}

# Key Pair
resource "aws_key_pair" "runner_key" {
  key_name   = "macgtd-runner-key"
  public_key = var.ssh_public_key
}

# EC2 Mac Instance
resource "aws_instance" "mac_runner" {
  ami               = data.aws_ami.mac.id
  instance_type     = var.mac_instance_type
  host_id           = aws_ec2_host.mac_host.id
  key_name          = aws_key_pair.runner_key.key_name
  subnet_id         = aws_subnet.runner_subnet.id
  availability_zone = var.availability_zone

  vpc_security_group_ids = [aws_security_group.runner_sg.id]

  root_block_device {
    volume_size = 200
    volume_type = "gp3"
  }

  user_data = templatefile("${path.module}/templates/bootstrap.sh.tpl", {
    github_token   = var.github_runner_token
    github_repo    = var.github_repo
    runner_name    = "macgtd-ec2-mac"
    runner_labels  = "self-hosted,macOS,ARM64,e2e"
    alfred_license = var.alfred_powerpack_license
  })

  tags = {
    Name    = "macgtd-e2e-runner"
    Project = "MacGTD"
  }
}

# Find latest macOS AMI
data "aws_ami" "mac" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ec2-macos-*-arm64-*"]
  }

  filter {
    name   = "architecture"
    values = ["arm64_mac"]
  }
}
