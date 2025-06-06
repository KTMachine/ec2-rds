data "aws_ami" "windows" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["Windows_Server-${var.windows_version}-English-Full-Base-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}