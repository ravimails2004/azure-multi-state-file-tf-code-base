# Define Terraform provider
terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "prod-RSG"
    storage_account_name = "fiberprodenvstorage"
    container_name       = "prod-tstate"
    key                  = "instance.tfstate"
  }
}
# Configure the Azure provider
provider "azurerm" {
  environment = "public"
  features {}
}
