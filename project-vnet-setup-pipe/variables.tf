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
