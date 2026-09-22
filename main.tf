resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "main-vpc"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = local.public_subnet_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = local.private_subnet_cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}
resource "aws_route_table" "myroute" {

  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table_association" "myroute_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.myroute.id
}



resource "aws_instance" "my_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = aws_subnet.public_subnet.id
  tags = {
    Name = var.instance_name
    name = "shubham"
    env  = "dev"
  }
}

