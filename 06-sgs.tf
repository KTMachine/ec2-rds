resource "aws_security_group" "opeth_rdp_access" {
  name = "opeth_rdp_access"
  description = "Allow RDP access to Opeth instances"
  vpc_id = aws_vpc.prog_metal_vpc.id

  ingress {
    description = "RDP from anywhere"
    from_port  = var.rdp_port
    to_port = var.rdp_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "opeth-rdp-access"
    Environment = var.environment
  }
}