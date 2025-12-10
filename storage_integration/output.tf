output "name" {
  description = "The name of the storage integration"
  value       = snowflake_storage_integration.this.name
}

output "roles_granted" {
  description = "Roles granted USAGE on the integration"
  value       = var.roles_to_grant
}
