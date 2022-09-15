output "public_subnet_id" {
    description = "Id of the public subnet"
    value = aws_subnet.test_public_subnet.id
}

output "vpc_id" {
    description = "Id of the VPC"
    value = aws_vpc.test_vpc.id
}

