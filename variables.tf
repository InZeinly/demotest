variable "aws_region" {
  default = "eu-central-1"
}


variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type = string
  default = "172.31.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for publick subnet"
  type = string
  default = "172.31.0.0/20"
}

variable "my_ip" {
    description = "My ip"
    type = string
    sensitive = true
}