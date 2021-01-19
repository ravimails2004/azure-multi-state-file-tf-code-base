# Define Terraform provider
terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.project_key_sfname
  }
}
# Configure the Azure provider
provider "azurerm" {
  environment = "public"
  features {}
}
