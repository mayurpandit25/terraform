resource "aws_instance" "public_instance" {
    ami = "ami-019715e0d74f695be"
    instance_type = "t3.micro"
    key_name = "id_rsa"
    vpc_security_group_ids = [aws_security_group.sg]
    tags = {
        Name = "ubuntu"
    } 
} 
