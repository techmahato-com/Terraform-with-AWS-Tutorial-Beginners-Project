variable "vpc_id" {
  description = "VPC ID where the EC2 instance will be launched"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the Ubuntu 22.04 server"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair to use"
  type        = string
}
