variable "name" {
  default = ""
}


variable "location" {
  default = ""
}

variable "rsgname" {
   default = ""
}

variable "public_subnet_cidr" {
  type = list
  default = []
}

variable "private_subnet_cidr" {
  type = list
  default = []
}

variable "address_space" {
  type = list
  default = []


}
variable "target_group_addition" {
   default = ""
}

variable "vnet-name" {
  default = ""
   
}

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