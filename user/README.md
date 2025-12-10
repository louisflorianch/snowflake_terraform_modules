Example for use of the module user

module "snowflake_users" {
  source = "git::https://github.com/louisflorianch/snowflake_terraform_modules.git//user?ref=main"

  user_map = {
    jdoe = {
      first_name        = "John"
      last_name         = "Doe"
      email             = "john.doe@example.com"
      default_warehouse = "NONE"
      default_role      = "NONE"
    }

    asmith = {
      first_name        = "Anna"
      last_name         = "Smith"
      email             = "anna.smith@example.com"
      default_warehouse = "ANALYTICS_WH"
      default_role      = "ANALYST"
    }
  }
}
