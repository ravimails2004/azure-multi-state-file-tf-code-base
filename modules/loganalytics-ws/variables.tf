variable "resource_group_name" {
  description = "The resource group name to be imported"
}

variable "env" {
  description = "The environment for which log analytics workspace is created"
}

variable "log_analytics_workspace_sku" {
  description = "The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018"
  default     = "PerGB2018"
}

variable "log_retention_in_days" {
  description = "The retention period for the logs in days"
  default     = 30
}

variable "location" {
  default = "CentralIndia"
}
