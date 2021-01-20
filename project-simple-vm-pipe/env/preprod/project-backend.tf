# Define Terraform provider
terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "preprod-RSG"
    storage_account_name = "fiberpreprodenvstorage"
    container_name       = "preprod-tstate"
    key                  = "instance.tfstate"
  }
}
# Configure the Azure provider
provider "azurerm" {
  environment = "public"
  features {}
}
