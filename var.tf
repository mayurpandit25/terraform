variable "vpc" {
    default = "10.0.0.0/16"
}

variable "public_subnet" {
    default = "10.0.0.0/20"
}

variable "private_subnet" {
    default = "10.0.16.0/20"
}

variable "public_az" {
    default = "ap-south-1a"
}

variable "private_az" {
    default = "ap-south-1b" 
}

variable "ami" {
    default = "ami-019715e0d74f695be" 
}

variable "instance_type" {
    default = "t3.micro"
}

