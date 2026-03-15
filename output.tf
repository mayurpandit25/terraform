output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

output "public_ip" {
    value = aws_instance.public_instance.public_ip
}

output "private_ip" {
    value = aws_instance.private_instance.private_ip
}

output "sg_id" {
    value = aws_security_group.sg.id
}


