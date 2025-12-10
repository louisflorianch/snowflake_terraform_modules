Example for use of the module warehouse

module "warehouse" {
  source = "git::https://github.com/louisflorianch/snowflake_terraform_modules.git//warehouseref=main"

  # Warehouse configuration
  warehouse_name       = "ANALYTICS_WH"
  warehouse_type       = "STANDARD"
  warehouse_size       = "XSMALL"
  max_cluster_count    = 1
  min_cluster_count    = 1
  scaling_policy       = "STANDARD"
  auto_suspend         = 60
  auto_resume          = true
  initially_suspended  = false
  comment              = "Analytics Warehouse"
  enable_query_acceleration           = false
  query_acceleration_max_scale_factor = 1
  max_concurrency_level               = 1
  statement_queued_timeout_in_seconds = 300
  statement_timeout_in_seconds        = 3600

  # Grant privileges
  # Map where key = privilege, value = account role
  warehouse_privileges = {
    "USAGE"   = "ANALYST_ROLE",
    "MONITOR" = "ANALYST_ROLE",
    "OPERATE" = "ANALYST_ROLE"
  }
}

