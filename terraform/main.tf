provider "aws" {
  region = "eu-north-1"
  profile = "terraform-user"
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP traffic"

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
  ami           = "ami-000e50175c5f86214"
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_http.name]
  associate_public_ip_address = true

  key_name = "putty-console"
  
  tags = {
    Name = "FastAPI-App-Server"
  }
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
  description = "The public IP of the EC2 instance"
}