rsgname = "dev-RSG"
vnet-name = "dev-vnet"
name = "dev"
location = "Central India"
address_space = ["192.168.0.0/16"]
private_subnet_cidr = ["192.168.32.0/19", "192.168.64.0/19","192.168.96.0/19"]
public_subnet_cidr = ["192.168.0.0/19"]
target_group_addition = "false"
#Backend.tf specific variables
resource_group_name_vnet = "dev-RSG"
storage_account_name = "fiberdevenvstorage"
container_name = "dev-tstate"
vnet_key_state_fname = "vnet.tfstate" 
