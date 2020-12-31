output "resource-group-name" {
  value = data.azurerm_resource_group.resource-group.name
}

output "resource-group-location" {
  value = data.azurerm_resource_group.resource-group.location
}
