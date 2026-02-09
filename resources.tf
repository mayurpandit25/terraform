resource "aws_instance" "ec2" {
    ami           = "ami-08d59269edddde222"
    instance_type = "t3.micro"
    key_name      = "ubuntu"
    count         = 2
    tags     = {
        Name = "my-ec2"
    }
}
