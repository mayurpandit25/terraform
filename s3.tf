resource "aws_s3_bucket" "s3_bucket" {
    region = "ap-south-1"
    bucket = "mayur-s3-bucket-amazon1232"

    tags = {
        Name = "mayur-s3-bucket-amazon1232"
    }
}
