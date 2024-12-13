provider "aws" {
  region = "us-east-1"  # Modify as per your region
}

# Create a DB subnet group for the RDS instance
resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "rds-subnet-group"
  description = "My RDS DB subnet group"
  subnet_ids  = [var.subnet_id_1, var.subnet_id_2]

  tags = {
    Name = "rds-subnet-group"
  }
}

# Create RDS MySQL instance
module "rds_mysql" {
  source = "terraform-aws-modules/rds/aws//modules/db_instance"
  version = "~> 6.0"  # Ensure you are using a stable version

  identifier             = "mysql-db-instance"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.instance_type
  allocated_storage      = var.allocated_storage
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = []  # Provide security group IDs if needed
  db_name                = "mydatabase"
  username               = var.db_admin_username
  password               = var.db_admin_password
  skip_final_snapshot    = true
  publicly_accessible    = true
  multi_az               = false
}

# Output RDS endpoint
output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds_mysql.db_instance_endpoint
}


