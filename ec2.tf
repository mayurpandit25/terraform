/* resource "aws_instance" "public_instance" {
    for_each = tomap({
        server1 = "t3.micro"
        server2 = "t3.small"
    })

    ami = "ami-019715e0d74f695be"
    instance_type = each.value
    key_name = "id_rsa"
    vpc_security_group_ids = [aws_security_group.sg.id]
    user_data = file("/root/terraform/user_data.sh")
    depends_on = [ aws_security_group.sg ]
    # count = 2

    lifecycle {
      ignore_changes = [ count ]
    }

    root_block_device {
      volume_size = var.env == "dev" ? 20 : var.volume_size
      volume_type = var.env == "prod" ? "gp2" : var.volume_type
    }

    lifecycle {
      create_before_destroy = true 
    }

    tags = {
        Name = each.key
    } 
}
 */