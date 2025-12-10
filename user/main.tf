# with all attributes set

resource "snowflake_user" "user" {
  for_each = var.user_map

  name         = "${each.value["first_name"]}_${each.value["last_name"]}"
  login_name   = each.key
  first_name   = each.value["first_name"]
  last_name    = each.value["last_name"]
  email        = each.value["email"]
  display_name = "${each.value["first_name"]}_${each.value["last_name"]}"

  default_warehouse = (
    lookup(each.value, "default_warehouse", "NONE") == "NONE"
    ? "COMPUTE_WH"
    : each.value["default_warehouse"]
  )

  default_role = (
    lookup(each.value, "default_role", "NONE") == "NONE"
    ? "PUBLIC"
    : each.value["default_role"]
  )
}
