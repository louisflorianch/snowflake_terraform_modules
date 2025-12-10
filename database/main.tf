
## Complete (with every optional set)
resource "snowflake_database" "database_standard" {
  name         = var.database_name
  is_transient = var.is_transient
  comment      = var.comment

  data_retention_time_in_days                   = var.data_retention_time_in_days
  max_data_extension_time_in_days               = var.max_data_extension_time_in_days
  suspend_task_after_num_failures               = var.suspend_task_after_num_failures
  task_auto_retry_attempts                      = var.task_auto_retry_attempts
  user_task_managed_initial_warehouse_size      = var.user_task_managed_initial_warehouse_size
  user_task_timeout_ms                          = var.user_task_timeout_ms

}


resource "snowflake_grant_privileges_to_account_role" "database_grants" {
  for_each = var.database_privileges
  account_role_name = each.value
  privileges        = each.key

  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_name
  }

  depends_on = [snowflake_database.database_standard]
}
