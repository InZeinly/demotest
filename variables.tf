variable "aws_region" {
  default = "eu-central-1"
}


variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type = string
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr_block" {
  description = "CIDR block for publick subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "my_ip" {
    description = "192.168.0.111"
    type = string
    sensitive = true
}