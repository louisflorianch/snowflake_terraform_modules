# Create database roles
resource "snowflake_database_role" "db_roles" {
  for_each = toset(var.roles)

  database = var.database_name
  name     = each.key
}

# Prepare inheritance pairs
locals {
  inheritance_pairs = flatten([
    for role_name, parents in var.inheritance : [
      for parent in parents : {
        role   = role_name
        parent = parent
      }
    ]
  ])
}

# Grant database roles to parent roles
resource "snowflake_grant_database_role" "inheritance" {
  for_each = {
    for pair in local.inheritance_pairs :
    "${pair.role}__${pair.parent}" => pair
  }

  database_role_name = "${var.database_name}.${each.value.role}"
  parent_role_name   = each.value.parent

  depends_on = [snowflake_database_role.db_roles]
}

