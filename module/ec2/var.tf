variable "ami" {}
variable "instance_type" {}
variable "sg_id" {
  description = "Security group ID"
  type        = string
}
variable "public_subnet" {}
variable "private_subnet" {}
