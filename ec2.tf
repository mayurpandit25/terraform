resource "aws_instance" "public_instance" {
    for_each = tomap({
        server1 = "t3.micro"
        server2 = "t3.medium"
    })

    ami = "ami-019715e0d74f695be"
    instance_type = each.value
    key_name = "id_rsa"
    vpc_security_group_ids = [aws_security_group.sg.id]
    user_data = file("/root/terraform/user_data.sh")

    root_block_device {
      volume_size = 10
      volume_type = "gp3"
    }

    tags = {
        Name = each.key
    } 
}
