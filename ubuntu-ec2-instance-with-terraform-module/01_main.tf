provider "aws" {
  region = "us-east-1"
}

# Security Group for the EC2 instance
resource "aws_security_group" "ubuntu_sg" {
  name        = "Ubuntu-Pritunl-SG"
  description = "Security Group for Ubuntu-Pritunl-Server"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP access from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }
}

# EC2 Instance
resource "aws_instance" "ubuntu_pritunl" {
  ami           = var.ami_id               # AMI ID for Ubuntu 22.04
  instance_type = "t2.micro"               # Instance type
  subnet_id     = var.subnet_id            # Public Subnet ID
  key_name      = var.key_name             # Key pair for SSH access
  vpc_security_group_ids = [aws_security_group.ubuntu_sg.id]  # Attach Security Group
  associate_public_ip_address = true  # Ensure public IP is assigned

  tags = {
    Name = "Ubuntu-Pritunl-Server"
  }
}
