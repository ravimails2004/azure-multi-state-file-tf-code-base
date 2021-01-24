variable "create_peering_connection" {
      default = "false"
}

variable "vnet_dest_ids" {
   type = list
   default = []
}

variable "rsgname_src" {
        default = ""
}
variable "vnet-name_src" {
        default = ""
}

variable "vnet_dest_names" {
   type = list
   default = []
}

variable "vnet_dest_resource_group_names" {
   type = list
   default = []
}
variable "vnet_src_id" {
     default = ""
}