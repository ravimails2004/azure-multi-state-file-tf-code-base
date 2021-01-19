data "terraform_remote_state" "vnet" {
    backend = "azurerm"
    config = {
      storage_account_name = var.storage_account_name
      container_name       = var.container_name
      key =  var.vnet_key_sfname
    }
}



variable  "storage_account_name" {
	default = ""

}
variable "container_name" {
	default = ""
}

variable  "vnet_key_sfname"  {
	default = ""	
}







