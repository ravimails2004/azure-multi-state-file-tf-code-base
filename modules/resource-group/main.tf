locals {
  common_tags = "${map(
    "Purpose", "Resource Group for Terraform State",
    "Owner", "DevOps",
    "CATEGORY", "Internal"
  )}"
}

resource "azurerm_resource_group" "RSG" {
        count = var.target_group_addition ? 1 : 0
        name = var.rsgname
        location = var.location
        tags = merge(
             local.common_tags,
             map( 
                 "APPNAME", var.appname,  
                 "ENV",   var.env,
                 "DEVOWNER", var.devowner

               ) )
}

data "azurerm_resource_group" "RSG" {
  name = var.rsgname
  depends_on = [ azurerm_resource_group.RSG ]
}
