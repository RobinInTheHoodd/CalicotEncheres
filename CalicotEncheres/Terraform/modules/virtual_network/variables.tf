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


