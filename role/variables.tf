variable "database_name" {
  type        = string
  description = "Snowflake database where the roles will be created"
}

variable "roles" {
  description = "List of database role names to create"
  type        = list(string)
  default     = []
}

variable "inheritance" {
  description = <<EOT
Map defining role inheritance:
{
  role_name = ["PARENT1", "PARENT2"]
}
EOT
  type    = map(list(string))
}


