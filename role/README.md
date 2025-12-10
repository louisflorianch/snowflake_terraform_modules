module "db_roles" {
  source        = "./modules/database_roles"
  database_name = "MYDB"

  roles = ["APP_ROLE", "ANALYTICS_ROLE", "FINANCE_ROLE"]

  inheritance = {
    APP_ROLE       = ["SYSADMIN"]
    ANALYTICS_ROLE = ["SYSADMIN", "SECURITYADMIN"]
    FINANCE_ROLE   = []
  }
}