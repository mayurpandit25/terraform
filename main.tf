module "vpc" {
    source = "./module/vpc"
    vpc_cidr = "10.0.0.0/16"
    public_subnet_cidr  = "10.0.0.0/20"
    private_subnet_cidr = "10.0.16.0/20"
    public_az  = "ap-south-1a"
    private_az = "ap-south-1b"
}

module "sg" {
    source = "./module/sg"
    sgname = "my-sg-group"
    vpc_id = module.vpc.vpc_id
    ingress_http = 80
    ingress_ssh = 22
}

module "ec2" {
    source = "./module/ec2"
    ami = "ami-019715e0d74f695be" 
    instance_type = "t3.micro"
    sg_id = module.sg.sg_id
    public_subnet = module.vpc.public_subnet_id
    private_subnet = module.vpc.private_subnet_id
}



