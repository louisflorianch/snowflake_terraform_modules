module "azure_storage_integration" {
  source = ".""git::https://github.com/louisflorianch/snowflake_terraform_modules.git//storage_integration?ref=main"

  name                      = "MY_AZURE_INT"
  comment                   = "Integration for Azure Storage"
  type                      = "EXTERNAL_STAGE"
  storage_allowed_locations = ["azure://mycontainer.blob.core.windows.net/"]
  storage_blocked_locations = []

  azure_tenant_id          = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  use_privatelink_endpoint = true

  roles_to_grant = ["ANALYTICS_ROLE", "APP_ROLE"]
}
