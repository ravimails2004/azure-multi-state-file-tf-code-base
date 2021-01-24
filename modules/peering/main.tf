resource "azurerm_virtual_network_peering" "peering_src" {
  count  = var.create_peering_connection && length(var.vnet_dest_ids) > 0 ? length(var.vnet_dest_ids) : 0
  name =  format("to-%s", element(var.vnet_dest_names.*.id, count.index))
  resource_group_name          = var.rsgname_src   #String
  virtual_network_name         = var.vnet-name_src  #Vnet source name String
  #remote_virtual_network_id    = var.vnet_dest_ids #List
  remote_virtual_network_id    = element(var.vnet_dest_ids.*.id, count.index)
}

resource "azurerm_virtual_network_peering" "peering_dest" {
  count  = var.create_peering_connection && length(var.vnet_dest_names) > 0 ? length(var.vnet_dest_names) : 0
  name   = format("from-%s", var.vnet-name_src)

  #resource_group_name          = var.vnet_dest_resource_group_names #List
  resource_group_name          =  element(var.vnet_dest_resource_group_names.*.id, count.index)
  #virtual_network_name         = var.vnet_dest_names # List
  virtual_network_name         = element(var.vnet_dest_names.*.id, count.index)
  remote_virtual_network_id    = var.vnet_src_id # String
}








