/* resource "aws_instance" "ec2" {
    for_each = tomap({
        server1 = "t3.micro"
        server2 = "t3.small"
    })
    ami           = "ami-08d59269edddde222"
    instance_type = each.value
    key_name      = "ubuntu"
    depends_on    = [aws_s3_bucket.my_s3_bucket]

    root_block_device {
      volume_size = var.env == "dev" ? 20 : var.volume_size
      volume_type = var.env == "prod" ? "gp3" : var.volume_type
    }

    lifecycle {
      create_before_destroy = true 
    }

    tags     = {
        Name = each.key
    }
}

#########################
CREATION OF S3 BUCKET
#########################

resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "myamazon-s3-bucket-757696969"
    region = "ap-southeast-1"

    tags   = {
      Name = "myamazon-s3-bucket-757696969"
    } 

    lifecycle {
      prevent_destroy = true 
    }
}

##########################
USING THE OWN CREATED KEY
##########################

resource "aws_key_pair" "my_key" {
    key_name   = "id_rsa"
    public_key = file("/root/.ssh/id_rsa.pub")
    }
}

#########################
CREATION OF VPC
#########################

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnet
  availability_zone       = var.public_az
  map_public_ip_on_launch = var.public_map

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet
  availability_zone = var.private_az

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "igw"
  }
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "nat-gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

#########################
CREATION OF SECURITY GROUP 
#########################

resource "aws_security_group" "sg" {
  name        = "my-security-group"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = var.ingress_ssh
    to_port     = var.ingress_ssh
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.ingress_http
    to_port     = var.ingress_http
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-sg"
  }
}

resource "aws_instance" "bastion_host" {
  ami           = var.ami 
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  user_data = <<-EOF
    #!/bin/bash
    set -xe

    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd

    echo "<h1>Welcome to Bastion Server</h1>" > /var/www/html/index.html
  EOF

  tags   = {
    Name = "bastion-host-server"
  }
}

resource "aws_instance" "private_server" {
  ami           = var.ami 
  instance_type = var.instance_type

  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "private-server"
  }
}

 */

resource "aws_instance" "new_instance" {}
