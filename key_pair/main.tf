resource "aws_key_pair" "my_key" {
    key_name   = "id_rsa"
    public_key = file("./id_rsa.pub")
}

