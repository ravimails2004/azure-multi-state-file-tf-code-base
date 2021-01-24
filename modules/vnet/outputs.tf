output "public-security-group-name" {
  value = azurerm_network_security_group.public-subnet-nsg.name
}

output "private-security-group-name" {
  value = ["$azurerm_network_security_group.private-subnet-nsg*.name" ]
}

output "vnet-id" {
    value = "${data.azurerm_virtual_network.vnet.id}"
}