terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow Jenkins Traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow from Personal CIDR block"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_block]
  }

  ingress {
    description      = "Allow SSH from Personal CIDR block"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Jenkins SG"
  }
}

data "aws_ami" "ubuntu_18_04" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.ubuntu_18_04.id
  instance_type   = "t2.micro"
  key_name        = var.key_name
  security_groups = [aws_security_group.jenkins_sg.name]
  # user_data       = "${file("install_jenkins.sh")}"
  user_data = templatefile("${path.module}/install_jenkins.sh",{})
  tags = {
    Name = "Jenkins Master"
  }
}

resource "aws_instance" "web2" {
  ami = data.aws_ami.ubuntu_18_04.id
  instance_type = "t2.micro"
  key_name = "aws-terraform"
  security_groups = [aws_security_group.jenkins_sg.name]
  # user_data       = "${file("install_jenkins.sh")}"
  user_data = templatefile("${path.module}/install_jenkins.sh",{})
  tags = {
    "Name" = "Jenkins Slave"
  }
}