resource "aws_instance" "ec2" {
    ami           = "ami-08d59269edddde222"
    instance_type = "t3.micro"
    key_name      = "ubuntu"
    count         = 2
    tags     = {
        Name = "my-ec2"
    }
}

resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-terraform-s3-bucket-123456789"
    region = "ap-southeast-1"

    tags   = {
      Name = "my-terraform-s3-bucket-123456789"
    } 
}

