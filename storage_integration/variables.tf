variable "name" {
  description = "Name of the storage integration"
  type        = string
}

variable "comment" {
  description = "Comment for the integration"
  type        = string
}

variable "type" {
  description = "Integration type (EXTERNAL_STAGE, etc.)"
}

variable "storage_allowed_locations" {
  description = "List of allowed storage locations"
  type        = list(string)
}

variable "storage_blocked_locations" {
  description = "List of blocked storage locations"
  type        = list(string)
  default     = []
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "use_privatelink_endpoint" {
  description = "Use Azure PrivateLink endpoint"
  type        = bool
  default     = false
}

variable "roles_to_grant" {
  description = "List of roles to grant USAGE on the integration"
  type        = list(string)
}

