/* variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "public_subnet" {
    default = "10.0.0.0/20"
}

variable "public_az" {
    default = "ap-southeast-1a"
}

variable "public_map" {
    default = "true"
}

variable "private_subnet" {
    default = "10.0.16.0/20" 
}

variable "private_az" {
    default = "ap-southeast-1b"
}

variable "ingress_http" {
    default = "80"
}

variable "ingress_ssh" {
    default = "22"
}

variable "ami" {
  default = "ami-069de344e657c5dc7"
}

variable "instance_type" {
    default= "t3.micro"
}

variable "key_name" {
    default = "ubuntu"  
}

 */

variable "volume_size" {
    default = 20
}

variable "volume_type" {
    default = "gp3"
}

variable "env" {
    default = "dev"
}

