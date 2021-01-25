variable "resource_group_name" {
  description = "The resource group name to be imported"
}

variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group"
}

variable "aks_client_secret" {
  description = "Client secret for AKS cluster Service Profile"
}

variable "private_subnet_id" {
  default = ""
  description = "Private subnet id for the aks cluster"
}
#variable "client_id" {
#  description = "The Client ID (appId) for the Service Principal used for the AKS deployment"
#}

#variable "client_secret" {
#  description = "The Client Secret (password) for the Service Principal used for the AKS deployment"
#}

variable "admin_username" {
  default     = "azureuser"
  description = "The username of the local administrator to be created on the Kubernetes cluster"
}

variable "system_agents_size" {
  default     = "Standard_D2s_v3"
  description = "The default virtual machine size for the Kubernetes agents"
}

variable "worker_agents_size" {
  default     = "Standard_D2s_v3"
  description = "The default virtual machine size for the Kubernetes agents"
}

variable "system_agents_count" {
  description = "The number of Agents that should exist in the Agent Pool"
  default     = 3
}

variable "system_agents_min_count" {
  description = "The number of Agents that should exist in the System Agent Pool"
  default     = 1
}

variable "system_agents_max_count" {
  description = "The number of Agents that should exist in the System Agent Pool"
  default     = 5
}

variable "worker_agents_min_count" {
  description = "The number of Agents that should exist in the System Agent Pool"
  default     = 1
}

variable "worker_agents_max_count" {
  description = "The number of Agents that should exist in the System Agent Pool"
  default     = 50
}

variable "worker_agents_count" {
  description = "The number of Agents that should exist in the Agent Pool"
  default     = 5
}

variable "public_ssh_key" {
  description = "A custom ssh key to control access to the AKS cluster"
  default     = ""
}

variable "system-tags" {
  type        = map(string)
  description = "Any tags that should be present on the Virtual Network resources"
  default     = {}
}

variable "worker-tags" {
  type        = map(string)
  description = "Any tags that should be present on the Virtual Network resources"
  default     = {}
}

variable "enable_log_analytics_workspace" {
  type        = bool
  description = "Enable the creation of azurerm_log_analytics_workspace and azurerm_log_analytics_solution or not"
  default     = true
}

variable "log_analytics_workspace_id" {

}

variable "log_analytics_workspace_name" {

}

variable "logs_ws_location" {
  default = "Central India"
}

variable "kubernetes_version" {

}
