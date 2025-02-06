provider "aws" {
  region = var.aws_region
}

# REMOVE this block since the security group already exists
# resource "aws_security_group" "web_sg" {
#   name        = "web-security-group"
#   description = "Allow HTTP inbound"
#
#   ingress {
#     description = "Allow HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#
#   egress {
#     description = "Allow all outbound"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name

  # Use the existing subnet
  subnet_id                   = "subnet-01bebe580dc2fba32"

  # Use the existing security group
  vpc_security_group_ids       = ["sg-076a8ba2eaa7d1401"]

  tags = {
    Name = "Flask-Docker-Host"
  }
}
