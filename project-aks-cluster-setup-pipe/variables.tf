variable "resource_group_name" {
  default = ""
}
variable  "env" {
  default = ""
}

variable  "aks_client_secret" {
  default = ""
}

variable "kubernetes_version" {
  default = ""
}
variable "admin_username" {
  default = ""
}
variable "system_agents_min_count" {

}
variable "system_agents_max_count" {

}
variable "system_agents_count" {

}
variable "system_agents_size" {

}
variable "private_subnet_id" {

}
variable "log_analytics_workspace_id" {

}
variable "worker_agents_size" {

}
variable "worker_agents_min_count" {

}
variable "worker_agents_max_count" {

}
variable "worker_agents_count" {

}
variable "logs_ws_location" {

}
variable "log_analytics_workspace_id" {

}
variable "log_analytics_workspace_name" {

}

variable "log_analytics_workspace_sku" {
   default = "PerGB2018"
}
variable "log_retention_in_days" {
  default = 30
}

variable "location" {

}