vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = "10.0.0.0/20"
private_subnet_cidr = "10.0.16.0/20"
public_az = "ap-south-1a"
private_az = "ap-south-1b"

sgname = "my-sg-group-vpc"
ingress_http = 80
ingress_ssh = 22

ami = "ami-019715e0d74f695be"
instance_type = "t3.micro"
