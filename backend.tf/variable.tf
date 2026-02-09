variable "ami" {
    default = "ami-08d59269edddde222"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "volume_size" {
    default = 20
}

variable "volume_type" {
    default = "gp3"
}

variable "key_name" {
    default = "ubuntu"
}

