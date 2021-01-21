variable "rsgname" {
   default = ""

}

variable "target_group_addition" {
   default = ""

}

variable "location" {
  default = "Central India"

}

variable "appname" {
  default = "fiber-dev"
}

variable "env" {
default = "dev"
}

variable "devowner" {
  default = "Ravi Sharma"
}

variable "publicip"{  
  default = "false"
}

variable "vmsize" { 
 default = "Standard_B2ms"
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

variable "vm_name" {
  default = "example-machine"
}
variable "nsg_name" { 
 default = "SSH"
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

variable "vnet_name" {
  default = ""
}


variable "subnet_name" {
  default = "private-subnet-1"
}

variable "subnet_resource_group" {
  default = ""
}

# Variable section for project state file
variable "resource_group_name" {
	default = ""
}

variable  "storage_account_name" {
	default = ""

}
variable "container_name" {
	default = ""
}

variable  "project_key_sfname"  {
	default = ""
}
