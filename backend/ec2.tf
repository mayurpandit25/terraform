resource "aws_instance" "ec2" {
    ami           = var.ami 
    instance_type = var.instance_type
    key_name      = var.key_name

    root_block_device {
      volume_size = var.volume_size
      volume_type = var.volume_type
    }

    lifecycle {
      create_before_destroy = true 
    }

    tags     = {
        Name = "ec2-instance"
    }
}



