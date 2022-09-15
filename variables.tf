variable "aws_region" {
  description = "AWS region to create resources"
  default     = "eu-central-1"
}

variable "vpc_id" {
  description = "VPC for Jenkins"
}

variable "cidr_block" {
  description = "CIDR Block to allow Jenkins Access"
}

variable "key_name" {
  description = "Name of keypair to ssh"
<<<<<<< HEAD
}
=======
}
>>>>>>> f6ed89e2116409a56796be6f546db0e08cc79e8d
