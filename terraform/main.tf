provider "aws" {
  region = "eu-north-1"  # Replace with your desired AWS region
}

resource "aws_security_group" "web_sg" {
  name        = "web-security-group-${random_string.suffix.result}"
  description = "Allow HTTP inbound"
  vpc_id      = "vpc-029ced3d52306d8d9"  # Replace with your VPC ID

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}
