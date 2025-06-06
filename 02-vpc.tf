resource "aws_vpc" "prog_metal_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name        = "prog-metal-vpc"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "prog_igw" {
  vpc_id = aws_vpc.prog_metal_vpc.id

  tags = {
    Name = "prog-metal-igw"
  }
}

resource "aws_route_table" "prog_rt" {
  vpc_id = aws_vpc.prog_metal_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prog_igw.id
  }

  tags = {
    Name = "prog-metal-rt"
  }

}