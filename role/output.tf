output "database_roles" {
  value = snowflake_database_role.db_roles
}

output "role_inheritance_grants" {
  value = snowflake_grant_database_role.inheritance
}