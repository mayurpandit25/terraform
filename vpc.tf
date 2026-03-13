resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my_vpc"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = "10.0.0.0/20"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true 
    tags = {
        Name = "public_subnet"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.my_vpc.id 
    cidr_block = "10.0.16.0/20"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "private_subnet"
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
        Name = "nat_eip"
    }
}

resource "aws_nat_gateway" "nat_gateway" {
    allocation_id = aws_eip.nat_eip.id 
    subnet_id = aws_subnet.public_subnet.id 
    tags = {
        Name = "nat_gateway"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.my_vpc.id 

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id 
    }

    tags = {
        Name = "public_rt"
    }
}

resource "aws_route_table_association" "public_rt_assoc" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.my_vpc.id 

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway.id  
    }

    tags = {
        Name = "private_rt"
    }
}

resource "aws_route_table_association" "private_rt_assoc" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_rt.id
}

resource "aws_instance" "public_instance" {
    ami = "ami-019715e0d74f695be"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.sg.id]
    user_data = file("/root/terraform/user_data.sh")
    subnet_id = aws_subnet.public_subnet.id
    associate_public_ip_address = true
    tags = {
        Name = "public_instance"
    }
}

resource "aws_instance" "private_instance" {
    ami = "ami-019715e0d74f695be"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id = aws_subnet.private_subnet.id
    tags = {
        Name = "private_instance"
    }
}




