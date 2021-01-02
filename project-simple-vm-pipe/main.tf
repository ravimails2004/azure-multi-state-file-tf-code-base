module "resource-group" {
  source = "./src/terraform/modules/resource-group"
  target_group_addition = var.target_group_addition
  name  =  var.name
  location = var.location
  appname  = var.appname
  env      = var.env
  devowner = var.devowner
}



module "vm" {
 source = "./src/terraform/modules/vm"
 depends_on = [module.resource-group]
 resource_group = var.name
 vm_name = var.vm_name
 publicip = var.publicip
 vmsize = var.vmsize
 image_publisher = var.image_publisher
 image_offer = var.image_offer
 image_sku = var.image_sku
 img_version = var.img_version
 nsg  = var.nsg
 nsg_name = var.nsg_name
 nsg_direction = var.nsg_direction
 nsg_proto = var.nsg_proto
 nsg_access = var.nsg_access
 nsg_dport = var.nsg_dport
 location = var.location
 appname  = var.appname
 env      = var.env
 devowner = var.devowner
 vnet_name = var.vnet_name
 subnet_name = var.subnet_name 
 subnet_resource_group = var.subnet_resource_group
}
