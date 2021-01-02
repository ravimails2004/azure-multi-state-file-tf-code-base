output "id" {
  value = data.azurerm_resource_group.RSG.id
}

output "subnet_id" {
  value = data.azurerm_subnet.privsubnet.id
}
