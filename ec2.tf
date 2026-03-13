resource "aws_instance" "public_instance" {
    ami = "ami-019715e0d74f695be"
    instance_type = "t3.micro"
    key_name = "id_rsa"
    vpc_security_group_ids = [aws_security_group.sg.id]
    user_data=<<-EOF
              #!/bin/bash
              sudo apt update 
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo systemctl enable apache2
              sudo echo "<h1> Welcome to ubuntu </h1>" | tee /var/www/html/index.html
              EOF
    tags = {
        Name = "ubuntu"
    } 
}
