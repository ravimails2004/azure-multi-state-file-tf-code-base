resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet-name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags = {
    Name    = var.vnet-name
    Purpose = "Vnet for ${var.resource_group_name}"
    Owner   = "DevOps"
  }
}


resource "azurerm_subnet" "public-subnet" {
  count                = var.create_public_subnet && length(var.public_subnet_cidr) > 0 ? length(var.public_subnet_cidr) : 0
  name                 = format("public-subnet-%s",  count.index + 1)
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  service_endpoints    = [ ]
  address_prefix     = element(concat(var.public_subnet_cidr, [""]), count.index)
  #address_prefix = "public"
  depends_on          = [azurerm_virtual_network.vnet]
}




resource "azurerm_subnet" "private-subnet" {
  count                = var.create_private_subnet && length(var.private_subnet_cidr) > 0 ? length(var.private_subnet_cidr) : 0
  name                 = format("private-subnet-%s",  count.index + 1)
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix     = element(concat(var.private_subnet_cidr, [""]), count.index)
  #address_prefix = "private"
  service_endpoints    = [ "Microsoft.Sql" ]
  depends_on          = [azurerm_virtual_network.vnet]
}

# Create NSG for private subnet

resource "azurerm_network_security_group" "private-subnet-nsg" {
  count               = var.create_private_subnet && length(var.private_subnet_cidr) > 0 ? length(var.private_subnet_cidr) : 0
  name                = format("private-subnet-nsg-%s", count.index + 1)
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "allow-all"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    Name    = format("private-subnet-nsg-%s", count.index + 1)
    Purpose = "NSG for private subnet of ${var.vnet-name} vnet"
    Owner   = "DevOps"
  }
}
#NSG->privatesubnet
resource "azurerm_subnet_network_security_group_association" "private-subnet-association" {
  count                     = var.create_private_subnet && length(var.private_subnet_cidr) > 0 ? length(var.private_subnet_cidr) : 0
  #subnet_id                 = azurerm_subnet.private-subnet.id
  subnet_id                 = element(azurerm_subnet.private-subnet.*.id,  count.index)
  network_security_group_id = element(azurerm_network_security_group.private-subnet-nsg.*.id, count.index)
  depends_on                = [azurerm_network_security_group.private-subnet-nsg]
}

#Public NSG
resource "azurerm_network_security_group" "public-subnet-nsg" {
  name                = "public-subnet-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "allow-all"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    Name    = "public-subnet-nsg"
    Purpose = "NSG for public subnet of ${var.vnet-name} vnet"
    Owner   = "DevOps"
  }
}

#NSG -> public subnet
resource "azurerm_subnet_network_security_group_association" "public-subnet-association" {
  count                     = var.create_public_subnet && length(var.public_subnet_cidr) > 0 ? length(var.public_subnet_cidr) : 0
  #subnet_id                 = azurerm_subnet.public-subnet.0.id
  subnet_id                 = element(azurerm_subnet.public-subnet.*.id,  count.index)
  network_security_group_id = azurerm_network_security_group.public-subnet-nsg.id
  depends_on                = [azurerm_subnet.public-subnet]
}


#NAT public IP assignment
resource "azurerm_public_ip_prefix" "nat-gw-pip-prefix" {
  count               = var.create_private_subnet && length(var.private_subnet_cidr) > 0 ? length(var.private_subnet_cidr) : 0
  name                = format("pip-prefix-nat-gw-%s",  count.index + 1)
  location            = var.location
  resource_group_name = var.resource_group_name
  prefix_length       = 30
  depends_on              =  [azurerm_subnet.private-subnet]
}



#Nat-GW create

resource "azurerm_nat_gateway" "nat-gw" {
  count                   = var.create_private_subnet && length(var.private_subnet_cidr) > 0 ? length(var.private_subnet_cidr) : 0
  name                    = format("nat-gw-%s",  count.index + 1)
  location                = var.location
  resource_group_name     = var.resource_group_name
  public_ip_prefix_ids    = [element(azurerm_public_ip_prefix.nat-gw-pip-prefix.*.id,  count.index)]
  sku_name                = "Standard"
  depends_on              =  [azurerm_subnet.private-subnet]
}

#NAT-GW-private-subnet-association
resource "azurerm_subnet_nat_gateway_association" "nat-subnet-assoc" {
  count          = var.create_private_subnet && length(var.private_subnet_cidr) > 0 ? length(var.private_subnet_cidr) : 0
  subnet_id      = element(azurerm_subnet.private-subnet.*.id,  count.index)
  nat_gateway_id = element(azurerm_nat_gateway.nat-gw.*.id,  count.index)
  depends_on                = [azurerm_subnet.private-subnet, azurerm_nat_gateway.nat-gw]

}

data "azurerm_virtual_network" "vnet" {
  name                 = var.vnet-name
  resource_group_name  = var.resource_group_name
}