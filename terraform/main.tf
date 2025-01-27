provider "aws" {
  region = "eu-north-1"
}

resource "aws_security_group" "web_sg" {
  name        = "web-security-group-${random_string.suffix.result}"
  description = "Allow HTTP inbound"
  vpc_id      = "vpc-029ced3d52306d8d9"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_traffic"
  }
}

resource "aws_instance" "web_server" {
  ami           = "ami-0d266d33ca564bca7"
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_http.name]
  associate_public_ip_address = true

  key_name = "Key_Pair"
  
  tags = {
    Name = "CD/CI Pipeline"
  }
}