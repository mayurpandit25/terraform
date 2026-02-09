provider "aws" {
    region = "ap-southeast-1"
    profile = "configs"
}

terraform {
  backend "s3" {
    bucket = "myamazon-s3-bucket-7576969694"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "cbz"
    profile = "configs"
    shared_credentials_files = [ "/root/.aws/credentials" ]
  }

}

