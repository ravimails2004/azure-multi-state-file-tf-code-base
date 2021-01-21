# Define Terraform provider
terraform {
  required_version = ">= 0.13"
  backend "azurerm" {
     resource_group_name  = "preprod-RSG"
    storage_account_name = "fiberpreprodenvstorage"
    container_name       = "preprod-tstate"
    key                  = "vnet.tfstate"
  }
}# Configure the Azure provider
provider "azurerm" {
  environment = "public"
  features {}
}
