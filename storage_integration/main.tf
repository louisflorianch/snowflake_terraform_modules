resource "snowflake_storage_integration" "this" {
  name                      = var.name
  comment                   = var.comment
  type                      = var.type
  enabled                   = true
  storage_allowed_locations = var.storage_allowed_locations
  storage_blocked_locations = var.storage_blocked_locations

  storage_provider         = "azure"
  azure_tenant_id          = var.azure_tenant_id
  use_privatelink_endpoint = var.use_privatelink_endpoint
}

# Grant USAGE on the integration to each role
resource "snowflake_grant_privileges_to_account_role" "usage" {
  for_each        = toset(var.roles_to_grant)
  account_role_name = each.value
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "INTEGRATION"
    object_name = snowflake_storage_integration.this.name
  }
}
