provider "aws" {
    region = "ap-south-1"
    profile = "config"
}

terraform {
  backend "s3" {
    bucket = "amazon-s3-bucket-mayur121"
    key = "terraform.tfstate"
    region = "ap-south-1"
    profile = "configs"
    shared_credentials_files = [ "/root/.aws/credentials" ]
    dynamodb_table = "cbz"
  }
}
