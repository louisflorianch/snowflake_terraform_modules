output "database_standard_name" {
  description = "The name of the database"
  value       = snowflake_database.database_standard.name
}