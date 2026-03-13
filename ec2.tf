resource "aws_instance" "public_instance" {
    ami = "ami-019715e0d74f695be"
    instance_type = "t3.micro"
    key_name = "id_rsa"
    vpc_security_group_ids = [aws_security_group.sg.id]
    user_data = file("/root/terraform/user_data.sh")
    count = 2

    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }

    tags = {
        Name = "ubuntu"
    } 
}
