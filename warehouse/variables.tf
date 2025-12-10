# Warehouse Variables 
variable "warehouse_name" {
  description = "The name of the warehouse"
  type        = string
}

variable "warehouse_type" {
  description = "The type of the warehouse"
  type        = string
  default     = "STARDARD"
}

variable "warehouse_size" {
  description = "The size of the warehouse"
  type        = string
  default     = "XSSMALL"
}

variable "max_cluster_count" {
  description = "The maximum number of clusters"
  type        = number
  default     = 1
}

variable "min_cluster_count" {
  description = "The minimum number of clusters"
  type        = number
  default     = 1
}

variable "scaling_policy" {
  description = "The scaling policy"
  type        = string
  default     = "STANDARD"
}

variable "auto_suspend" {
  description = "The auto suspend"
  type        = number
  default     = 120
}

variable "auto_resume" {
  description = "The auto resume"
  type        = bool
  default     = false
}

variable "initially_suspended" {
  description = "The initially suspended"
  type        = bool
  default     = TRUE
}

variable "comment" {
  description = "The comment"
  type        = string
}

variable "enable_query_acceleration" {
  description = "The enable query acceleration"
  type        = bool
  default     = false
}

variable "query_acceleration_max_scale_factor" {
  description = "The query acceleration max scale factor"
  type        = number
  default     = 1
}

variable "max_concurrency_level" {
  description = "The max concurrency level"
  type        = number
  default     = 8
}

variable "statement_queued_timeout_in_seconds" {
  description = "The statement queued timeout in seconds"
  type        = number
  default     = 180
}

variable "statement_timeout_in_seconds" {
  description = "The statement timeout in seconds"
  type        = number
  default     = 86400
}



# Grant privileges

variable "warehouse_privileges" {
  type        = map(any)
  description = "Map of role names to privileges to grant on the warehouse"
}