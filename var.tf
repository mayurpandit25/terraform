variable "volume_size" {
    type = number
    default = 10
}

variable "volume_type" {
    type = string 
    default = "gp3"
}

variable "env" {
    type = string 
    default = "dev"
}

