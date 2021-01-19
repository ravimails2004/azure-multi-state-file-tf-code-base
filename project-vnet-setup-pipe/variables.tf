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
#Variables being passed to backend.tf based on the environments defined under env{dev,preprod,prod}.variables.tfvar
variable "resource_group_name_vnet" {
    default = ""
}
variable "storage_account_name" {
    default = ""
}
variable "container_name" {
   default = ""
}
variable "vnet_key_state_fname" {
   default = ""
}













