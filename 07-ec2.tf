resource "aws_instance" "between_the_ec2_and_me" {
  ami = data.aws_ami.windows.id
  instance_type = var.instance_type
  key_name = aws_key_pair.queensryche_key.key_name
  subnet_id = aws_subnet.dreamtheater_public_subnet.id

  vpc_security_group_ids = [aws_security_group.opeth_rdp_access.id]

  user_data = <<-EOF
    <powershell>
    net user Administrator "${var.admin_password}"
    </powershell>
  EOF

  tags = {
    Name = "Between the EC2 and Me"
    Environment = var.environment
  }

}

resource "aws_eip" "allegeon_eip" {
  instance = aws_instance.between_the_ec2_and_me.id

  tags = {
    Name = "Allegaeon EIP"
    Environment = var.environment
  }
}