# Resource with required fields

# Resource with all fields
resource "snowflake_warehouse" "warehouse" {
  name                                =  var.warehouse_name
  warehouse_type                      =  var.warehouse_type
  warehouse_size                      =  var.warehouse_size
  max_cluster_count                   =  var.max_cluster_count
  min_cluster_count                   =  var.min_cluster_count
  scaling_policy                      =  var.scaling_policy
  auto_suspend                        =  var.auto_suspend
  auto_resume                         =  var.auto_resume
  initially_suspended                 =  var.initially_suspended
  comment                             =  var.comment
  enable_query_acceleration           =  var.enable_query_acceleration
  query_acceleration_max_scale_factor =  var.query_acceleration_max_scale_factor

  max_concurrency_level               =  var.max_concurrency_level
  statement_queued_timeout_in_seconds =  var.statement_queued_timeout_in_seconds
  statement_timeout_in_seconds        =  var.statement_timeout_in_seconds
}



resource "snowflake_grant_privileges_to_account_role" "grant_privileges" {
  for_each = var.warehouse_privileges
  account_role_name = each.value
  privileges        = each.key

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = var.warehouse_name
  }

  depends_on = [snowflake_warehouse.warehouse]
}
