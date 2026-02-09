module "vpc" {
    source              = "./module/vpc"
    vpc_cidr            = "10.0.0.0/16"
    public_subnet_cidr  = "10.0.0.0/20"
    private_subnet_cidr = "10.0.16.0/20"
    public_az           = "ap-southeast-1a"
    public_map          = true 
    private_az          = "ap-southeast-1b"
    ingress_http        = 80
    ingress_ssh         = 22 
    sgname              = "my-security-group"
}

module "ec2" {
    source        = "./module/ec2"
    ami           = "ami-069de344e657c5dc7"
    instance_type = "t3.micro"
    key_name      = "ubuntu"
    volume_size   = 20
    volume_type   = "gp3"
    subnet_id     = module.vpc.public_subnet_id
    sg_id         = module.vpc.sg_id

}

