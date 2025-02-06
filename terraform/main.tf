provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name

  subnet_id                   = "subnet-01bebe580dc2fba32"

  vpc_security_group_ids       = ["sg-076a8ba2eaa7d1401"]

  tags = {
    Name = "Flask-Docker-Host"
  }
}
