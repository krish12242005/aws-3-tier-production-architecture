variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}

variable "db_subnet_ids" {
  description = "Private database subnet IDs"
  type        = list(string)
}

variable "rds_security_group_id" {
  description = "Security group ID for RDS"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "database_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "appdb"
}

variable "database_username" {
  description = "PostgreSQL master username"
  type        = string
  default     = "appadmin"
}

variable "database_password" {
  description = "PostgreSQL master password"
  type        = string
  sensitive   = true
}