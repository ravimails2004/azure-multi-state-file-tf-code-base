module "resource-group" {
  source    = "./src/terraform/modules/resource-group"
  rsgname      = var.rsgname
  location = var.location
  target_group_addition = var.target_group_addition
}




module "vnet" {
  source    = "./src/terraform/modules/vnet"
  location  = module.resource-group.location
  resource_group_name = module.resource-group.rsgname
  vnet-name = var.vnet-name
  address_space = var.address_space
  environment = var.name

  create_public_subnet = true
  public_subnet_cidr = var.public_subnet_cidr

  create_private_subnet = true
  private_subnet_cidr = var.private_subnet_cidr

}

module "peering" {
  source    = "./src/terraform/modules/peering"
  depends_on = [module.vnet]
  create_peering_connection = true
  vnet_dest_ids = var.vnet_dest_ids
  rsgname_src = module.resource-group.rsgname
  vnet-name_src = var.vnet-name
  vnet_dest_names = var.vnet_dest_names
  vnet_dest_resource_group_names = var.vnet_dest_resource_group_names
  vnet_src_id = module.vnet.vnet-id

}




