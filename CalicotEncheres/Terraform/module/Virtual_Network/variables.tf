variable "vnet_name" {
  type = string
  default = "exemple_vnet"
}
variable "vnet_CIDR" {
  type = tuple([ string ])
  default = ["10.0.0.0/16"]
}

variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}


variable "subnet_name" {
  type = string
  default      = "exemple_subnet"
}
variable "subnet_prefixes" {
  default = ["10.0.1.0/24"]
}

