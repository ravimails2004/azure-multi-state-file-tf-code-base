locals {
  common_tags = "${map(
    "Purpose", "Resource Group for Terraform State",
    "Owner", "DevOps",
    "CATEGORY", "Internal"
  )}"
}


#Get the details of the resource group

data "azurerm_resource_group" "RSG" {
  name = var.resource_group
}

#Get the details of the subnet

data "azurerm_subnet" "privsubnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.subnet_resource_group
}


#Create Network security group with rules
resource "azurerm_network_security_group" "myterraformnsg" {
    count                        = var.nsg ? 1 : 0
    name                = "${var.vm_name}.SecurityGroup"
    location            = var.location
    resource_group_name = data.azurerm_resource_group.RSG.name

    security_rule {
        name                       = var.nsg_name
        priority                   = 1001
        direction                  = var.nsg_direction
        access                     = var.nsg_access
        protocol                   = var.nsg_proto
        source_port_range          = "*"
        destination_port_range     = var.nsg_dport
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
   tags = merge(
             local.common_tags,
             map(
                 "APPNAME", var.appname,
                 "ENV",   var.env,
                 "DEVOWNER", var.devowner
               ) )
}


#Create Network interface_if_public_turned_off

resource "azurerm_network_interface" "myterraformnic" {
    count                        = var.nsg ? 1 : 0
    name                      = "${var.vm_name}.myNIC"
    location                  = var.location
    resource_group_name       = data.azurerm_resource_group.RSG.name
    
    ip_configuration {                
        name                          = "${var.vm_name}.NicConfiguration"
        subnet_id                     = data.azurerm_subnet.privsubnet.id
        private_ip_address_allocation = "Dynamic"
    }   
        tags = merge(
             local.common_tags,
             map(
                 "APPNAME", var.appname,
                 "ENV",   var.env,
                 "DEVOWNER", var.devowner
               ) )
}


resource "azurerm_network_interface_security_group_association" "mynsg_association" {
    count                     = var.nsg ? 1 : 0  
    #network_interface_id      = azurerm_network_interface.myterraformnic.id
    network_interface_id      = azurerm_network_interface.myterraformnic[count.index].id
    network_security_group_id = azurerm_network_security_group.myterraformnsg[count.index].id
}




# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits = 4096
}
output "tls_private_key" { value = tls_private_key.example_ssh.private_key_pem }

# Create virtual machine_private
resource "azurerm_linux_virtual_machine" "myterraformvmPublic" {
    count                 = var.nsg ? 1 : 0
    name                  = "${var.vm_name}-public"
    location              = var.location
    resource_group_name   = data.azurerm_resource_group.RSG.name
    #network_interface_ids = [azurerm_network_interface.myterraformnic.id]
    network_interface_ids = [azurerm_network_interface.myterraformnic[count.index].id]
    size                  = var.vmsize

    os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = var.image_publisher
        offer     = var.image_offer
        sku       = var.image_sku
        version   = var.img_version
    }

    computer_name  = var.vm_name
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = tls_private_key.example_ssh.public_key_openssh
    }

    tags = merge(
             local.common_tags,
             map(
                 "APPNAME", var.appname,
                 "ENV",   var.env,
                 "DEVOWNER", var.devowner
               ) )


}
