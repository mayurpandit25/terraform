output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
    value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
    value = aws_subnet.private_subnet.id
}

output "public_ip" {
    value = aws_instance.public_instance.public_ip
}

output "private_ip" {
    value = aws_instance.private_instance.private_ip
}



