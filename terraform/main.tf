provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "fastapi_sg" {
  name        = "fastapi_sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
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
}

resource "aws_instance" "fastapi_app" {
  ami           = "ami-0d266d33ca564bca7"
  instance_type = "t2.micro"
  key_name      = "Key_Pair"
  vpc_security_group_ids = [aws_security_group.fastapi_sg.id]
  associate_public_ip_address = true
  
  tags = {
    Name = "CD/CI Pipeline"
  }

  subnet_id = "vpc-029ced3d52306d8d9"
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
  description = "The public IP of the EC2 instance"
}