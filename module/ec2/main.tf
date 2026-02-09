resource "aws_instance" "ec2" {
    ami           = var.ami 
    instance_type = var.instance_type
    key_name      = var.key_name 
    subnet_id     = var.subnet_id
    vpc_security_group_ids = var.sg_id 
    user_data = <<-EOF
      #!/bin/bash
      set -xe

      yum install -y httpd
      systemctl start httpd
      systemctl enable httpd

      echo "<h1>Welcome to Bastion Server</h1>" > /var/www/html/index.html
    EOF

    root_block_device {
      volume_size = var.volume_size
      volume_type = var.volume_type
    }

    lifecycle {
      create_before_destroy = true 
    }

    tags     = {
        Name = "ec2"
    }
}

