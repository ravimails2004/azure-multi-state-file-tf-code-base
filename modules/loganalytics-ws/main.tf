resource "azurerm_log_analytics_workspace" "wks" {
  name                = "org-${var.env}-embibe-CentralIndia"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_retention_in_days
  tags = {
    Name    = "org-${var.env}-embibe-CentralIndia"
    Purpose = "For collecting logs and running queries on them"
    Owner   = "DevOps"
  }
}

data "azurerm_log_analytics_workspace" "wks" {
  name                = "org-${var.env}-embibe-CentralIndia"
  resource_group_name = var.resource_group_name
}

output "log_analytics_workspace_id" {
  value = data.azurerm_log_analytics_workspace.wks.workspace_id
}

output "log_analytics_workspace_name" {
  value = data.azurerm_log_analytics_workspace.wks.name
}
