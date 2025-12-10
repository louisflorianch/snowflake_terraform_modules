variable "name" {
  description = "The name of the database"
  type        = string
}

variable "is_transient" {
  description = "Whether the database is transient"
  type        = bool
  default     = false
}

variable "comment" {
  description = "The comment for the database"
}

variable "data_retention_time_in_days" {
  description = "The data retention time in days"
  type        = number 
  default     = 10
}

variable " max_data_extension_time_in_days " {
  description = "The maximum data extension time in days"
  type        = number
  default     = 20
}

variable "suspend_task_after_num_failures" {
  description = "The number of failures to suspend the task"
  type        = number
  default     = 10
}

variable "task_auto_retry_attempts" {
  description = "The number of attempts to retry the task"
  type        = number
  default     = 10
}

variable "user_task_managed_initial_warehouse_size" {
  description = "The initial warehouse size for the user task"
  type        = string
  default     = "medium"

  validation {
    condition = contains(
      ["xsmall", "small", "medium", "large", "xlarge"],
      var.user_task_managed_initial_warehouse_size
    )

    error_message = "Invalid warehouse size. Must be one of: xsmall, small, medium, large, xlarge."
  }
}


variable "user_task_timeout_ms" {
  description = "The timeout for the user task"
  type        = number
  default     = 3600000
}