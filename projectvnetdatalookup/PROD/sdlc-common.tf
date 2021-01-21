data "terraform_remote_state" "vnet" {
    backend = "azurerm"
    config = {
      storage_account_name = "fiberprodenvstorage"
      container_name       = "prod-tstate"
      key = "vnet.tfstate"
    }
}
