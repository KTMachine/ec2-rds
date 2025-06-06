output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.between_the_ec2_and_me.id
}

output "public_ip" {
  description = "Public IP address of the Windows instance"
  value       = aws_eip.allegeon_eip.public_ip
}

output "rdp_connection_command" {
  description = "Command to connect via RDP"
  value       = "mstsc /v:${aws_eip.allegeon_eip.public_ip}"
}

output "administrator_password" {
  description = "Administrator password for the Windows instance"
  value       = var.admin_password
  sensitive   = true
}

output "private_key_filename" {
  description = "Name of the generated private key file"
  value       = local_file.metropolis_private_key.filename
  sensitive   = true
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.prog_metal_vpc.id
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = aws_subnet.dreamtheater_public_subnet.id
}