output "rsgname" {
   value = data.azurerm_resource_group.RSG.name
}

output "location" {
      value = data.azurerm_resource_group.RSG.location
}

output "id" {
  value = data.azurerm_resource_group.RSG.id
}
