# Resource Group

variable "resource_group_name" {
  description = "Nom du Resource Group"
  type        = string
  default     = "rg-calicot-web-dev-7"
}

variable "resource_group_location" {
  description = "Région Azure"
  type        = string
  default     = "Canada Central"
}

# SUBNET VNET

variable "vnet_name" {
    description = "Nom du Vnet"
    type        = string
    default     = "vnet-dev-calicot-cc-7"
}

# SUBNET WEB 

variable "subnet_name_web" {
  description = "Nom du Subnet"
  type = string
  default = "snet-dev-web-cc-7"
}

variable "subnet_prefixes_web" {
  default = ["10.0.1.0/24"]
}


# SUBNET DB


variable "subnet_name_db" {
  description = "Nom du Subnet"
  type = string
  default = "snet-dev-web-cc-7"
}

variable "subnet_prefixes_db" {
  default = ["10.0.2.0/24"]
}