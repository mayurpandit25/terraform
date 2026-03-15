resource "aws_security_group" "sg" {
    name = var.sgname
    description = var.sgname 
    vpc_id = var.vpc_id 

    ingress {
        from_port = var.ingress_http
        to_port = var.ingress_http
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = var.ingress_ssh
        to_port = var.ingress_ssh
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = var.sgname
    }
}
