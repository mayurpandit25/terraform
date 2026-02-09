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
    bucket = "myamazon-s3-bucket-757696969"
    region = "ap-southeast-1"

    tags   = {
      Name = "myamazon-s3-bucket-757696969"
    } 
}

