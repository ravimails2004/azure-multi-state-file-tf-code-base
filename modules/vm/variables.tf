variable "publicip"{
  default = ""
}

variable "vmsize" {
 default = ""
}

variable "image_publisher" {
  default = "Canonical"
}
variable "image_offer" {
  default = "UbuntuServer"
}
variable "image_sku" {
   default = "18.04-LTS"
}
variable "img_version" {
  default = "latest"
}

variable "nsg" {
 default = "true"
}

variable "name" {
  default = ""
}

variable "vm_name" {
  default = "example-machine"
}
variable "nsg_name" {
 default = "nsg"
}

variable "nsg_direction" {
  default = "Inbound"
}

variable "nsg_proto" {
 default = "Tcp"
}
variable "nsg_access" {
  default = "Allow"
}

variable "nsg_dport" {
  default = "22"
}

variable "subnet_name" { }

variable "vnet_name" { }

variable "resource_group" { }

variable "location" {
  default = "Central India"

}

variable "appname" {
  default = ""
}

variable "env" {
default = ""
}

variable "devowner" {
  default = ""
}

variable "subnet_resource_group" {
  default = ""
}
