resource "aws_vpc" "prod" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  region = "ap-south-1"
  enable_dns_hostnames = true
  tags = {
    Name = "Production Main VPC"
  }
}



resource "aws_subnet" "pub_sub" {
    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"

    tags = {
      Name = "Production Public Subnet"
      Owner = "Naresh"
    }
  
}

resource "aws_subnet" "prod-private-sn" {

    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"

    tags = {
      Name  = "Production Private subnet"
      Owner = "Naresh"
    }
  
}