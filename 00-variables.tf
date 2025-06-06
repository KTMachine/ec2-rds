variable "region" {
  description = "AWS region to deploy resources"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string 
  default = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSh key pair"
  type = string 
  default = "queensryche_key"
}

variable "windows_version" {
  type = string 
  default = "2019"
}

variable "rdp_port" {
  description = "Port for RDP access"
  type = number
  default = 3389
}

variable  "admin_password" {
  description = "Administrator password for Windows instance"
  type = string
  sensitive = true
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type = string
  default = "10.11.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type = string
  default = "10.11.1.0/24"
}

variable "environment" {
  description = "Environment tag"
  type = string
  default = "dev"
}