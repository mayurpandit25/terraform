/* resource "aws_instance" "ec2" {
    ami           = "ami-08d59269edddde222"
    instance_type = "t3.micro"
    key_name      = "ubuntu"
    count         = 2
    tags     = {
        Name = "my-ec2"
    }
}

resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "myamazon-s3-bucket-757696969"
    region = "ap-southeast-1"

    tags   = {
      Name = "myamazon-s3-bucket-757696969"
    } 
}

 */

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "my-vpc"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = "10.0.0.0/20"
    availability_zone = "ap-southeast-1a"
    tags = {
        Name = "public-subnet"
    }
    map_public_ip_on_launch = true 
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = "10.0.16.0/20"
    availability_zone = "ap-southeast-1b"
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
    tags   = {
        Name = "nat-eip"
    }
}

resource "aws_nat_gateway" "nat_gateway" {
    allocation_id = aws_eip.nat_eip.id 
    subnet_id = aws_subnet.public_subnet.id 
    tags = {
        Name = "nat-gateway"
    }
}

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.my_vpc.id 

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id 
    }

    tags = {
        Name = "public-route-table"
    }
}

resource "aws_route_table_association" "public_rt_association" {
    subnet_id = aws_subnet.public_subnet.id 
    route_table_id = aws_route_table.public_route_table.id 
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.my_vpc.id 

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway.id 
    }

    tags = {
        Name = "private-route-table"
    }
}

resource "aws_route_table_association" "private_rt_association" {
    subnet_id = aws_subnet.private_subnet.id 
    route_table_id = aws_route_table.private_route_table.id
}

