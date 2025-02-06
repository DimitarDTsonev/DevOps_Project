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
  default     = "subnet-01bebe580dc2fba32" 
  description = "Existing Subnet ID where the EC2 instance should be launched"
}

variable "vpc_id" {
  type        = string
  default     = "vpc-029ced3d52306d8d9"
  description = "Existing VPC ID"
}

variable "security_group_id" {
  type        = string
  default     = "sg-076a8ba2eaa7d1401"
  description = "Existing Security Group ID"
}
