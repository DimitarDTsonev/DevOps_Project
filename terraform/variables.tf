variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "ami_id" {
  type    = string
  default = "ami-0b4c22dcb7ee5ee67"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type        = string
  default     = "Key_Pair" 
  description = "Name of your existing AWS key pair"
}

variable "subnet_id" {
  type        = string
  default     = ""
  description = "Subnet ID if you have a custom subnet"
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "VPC ID if you have a custom VPC"
}