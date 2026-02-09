resource "aws_instance" "ec2" {
    ami           = "ami-08d59269edddde222"
    instance_type = "t3.micro"
    key_name      = "ubuntu"

    root_block_device {
      volume_size = 20
      volume_type = "gp3"
    }

    lifecycle {
      create_before_destroy = true 
    }

    tags     = {
        Name = "ec2-instance"
    }
}


