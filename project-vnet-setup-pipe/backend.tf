# Define Terraform provider
terraform {
  required_version = ">= 0.13"
  backend "azurerm" {
    resource_group_name  = var.resource_group_name_vnet
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.vnet_key_state_fname
  }
}# Configure the Azure provider
provider "azurerm" {
  environment = "public"
  features {}
}
