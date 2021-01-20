data "terraform_remote_state" "vnet" {
    backend = "azurerm"
    config = {
      storage_account_name = "fiberpreprodenvstorage"
      container_name       = "preprod-tstate"
      key = "vnet.tfstate"
    }
}
