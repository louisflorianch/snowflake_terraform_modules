Example for use of the module user

module "database" {
  source = "git::https://github.com/louisflorianch/snowflake_terraform_modules.git//database?ref=main"

  # Database configuration
  database_name = "ANALYTICS_DB"
  is_transient  = false
  comment       = "Analytics database for reporting"

  data_retention_time_in_days              = 1
  max_data_extension_time_in_days          = 7
  suspend_task_after_num_failures          = 3
  task_auto_retry_attempts                 = 2
  user_task_managed_initial_warehouse_size = "XSMALL"
  user_task_timeout_ms                     = 3600000

  # Grant privileges
  # Map where key = privilege, value = account role
  database_privileges = {
    "USAGE"     = "ANALYST_ROLE",
    "MONITOR"   = "ANALYST_ROLE",
    "OWNERSHIP" = "DB_ADMIN_ROLE"
  }
}