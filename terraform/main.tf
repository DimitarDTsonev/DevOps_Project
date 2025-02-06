provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name

  subnet_id                   = var.subnet_id

  vpc_security_group_ids       = [var.security_group_id]

  tags = {
    Name = "Flask-Docker-Host"
  }
}
