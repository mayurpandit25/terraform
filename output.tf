/* output "vpc_id" {
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
 */

output "vpc_id" {
    value = module.vpc.vpc_id
}

output "public_subnet_id" {
    value = module.vpc.public_subnet_id
}

output "sg_id" {
    value = module.sg.sg_id  
}

output "public_instance_ip" {
    value = module.ec2.public_ip
}

