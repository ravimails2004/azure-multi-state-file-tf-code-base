variable "location" {
  default = ""
}

variable "resource_group_name" {
  default = ""
}

variable "vnet-name" {
  default = ""
}

variable "address_space" {
  default = []
}

variable "environment" {
  default = ""
}

variable "address_prefix_public" {
  default = ""
}

variable "address_prefix_private" {
  default = ""
}



variable "create_public_subnet" {
  default = "false"
}


variable "create_private_subnet" {
  default = "false"
}

variable "public_subnet_cidr" {
  type = list
  default = []
}

variable "private_subnet_cidr" {
  type = list
  default = []
}



variable "ddos_protection_plan_id" {
  default = ""
}

variable "ddos_protection_plan_enable" {
  default = false
}

