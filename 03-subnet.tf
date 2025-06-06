resource "aws_subnet" "dreamtheater_public_subnet" {
  vpc_id = aws_vpc.prog_metal_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "prog-metal-public-subnet"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "dreamtheater_public_subnet_association" {
  subnet_id      = aws_subnet.dreamtheater_public_subnet.id
  route_table_id = aws_route_table.prog_rt.id
}