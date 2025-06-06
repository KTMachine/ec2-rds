resource "tls_private_key" "windows_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "queensryche_key" {
  key_name = var.key_name
  public_key = tls_private_key.windows_key.public_key_openssh

  tags = {
    Environment = var.environment
  }
}

resource "local_file" "metropolis_private_key" {
  content = tls_private_key.windows_key.private_key_pem
  filename = "${var.key_name}.pem"
  file_permission = "0400"
}