variable "aws_region" {
  description = "AWS region to create resources"
  default     = ["eu-central-1"]
}

variable "vpc_id" {
  description = "VPC for Jenkins"
  default = "vpc-0645f74fa2d2a544f"
}

variable "cidr_block" {
  description = "CIDR Block to allow Jenkins Access"
  default = "0.0.0.0/0"
}

variable "key_name" {
  description = "Name of keypair to ssh"
  default = "aws-terraform"
}

variable "install_jenkins" {
  description = "Install Jenkins"
  default = "${file("install_jenkins.sh")}"
}

variable "install_docker" {
  description = "Install Docker"
  default = "${file("install_docker.sh")}"
}