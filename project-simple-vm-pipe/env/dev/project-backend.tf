# Define Terraform provider
terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "dev-RSG"
    storage_account_name = "fiberdevenvstorage"
    container_name       = "dev-tstate"
    key                  = "instance.tfstate"
  }
}
# Configure the Azure provider
provider "azurerm" {
  environment = "public"
  features {}
}
