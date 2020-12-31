variable "name" {
  default = ""
}


variable "location" {
  default = ""
}

variable "rsgname" {

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
