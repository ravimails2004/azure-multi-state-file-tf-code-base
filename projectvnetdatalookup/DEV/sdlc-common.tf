data "terraform_remote_state" "vnet" {
    backend = "azurerm"
    config = {
      storage_account_name = "fiberdevenvstorage"
      container_name       = "dev-tstate"
      key = "vnet.tfstate"
    }
}
