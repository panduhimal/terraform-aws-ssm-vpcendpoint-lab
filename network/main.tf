data "aws_availability_zones" "azs" {
    state = "available"
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr

  instance_tenancy = "default"

  enable_dns_hostnames = true
  enable_dns_support = true


  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
  availability_zone = sort(data.aws_availability_zones.azs.names)[0]

  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-subnet-rt"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}