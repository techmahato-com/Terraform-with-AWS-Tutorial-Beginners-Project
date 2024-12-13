variable "vpc_id" {
  description = "VPC ID where the RDS instance will be deployed"
  type        = string
}

variable "subnet_id_1" {
  description = "Subnet ID where the RDS instance will be deployed"
  type        = string
}

variable "subnet_id_2" {
  description = "The second subnet ID in another AZ"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type for the RDS MySQL"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage for RDS instance (in GB)"
  type        = number
  default     = 20
}

variable "db_admin_username" {
  description = "The username for the RDS MySQL admin"
  type        = string
}

variable "db_admin_password" {
  description = "The password for the RDS MySQL admin"
  type        = string
  sensitive   = true
}
