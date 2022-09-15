variable "aws_region" {
  description = "AWS region to create resources"
  default     = "eu-central-1"
}

variable "vpc_id" {
  description = "172.31.0.0/16"
}

variable "cidr_block" {
  description = "0.0.0.0/0"
}

variable "key_name" {
  description = "Name of keypair to ssh"
}
