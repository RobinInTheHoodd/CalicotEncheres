# Resource Group

variable "resource_group_name" {
  description = "Nom du Resource Group"
  type        = string
  default     = "rg-calicot-web-qa-7"
}

variable "resource_group_location" {
  description = "Région Azure"
  type        = string
  default     = "Canada Central"
}

variable "resource_group_name_img_store" {
  description = "Nom du Resource Group"
  type        = string
  default     = "rg-calicot-commun"
}


# SUBNET VNET

variable "vnet_name" {
  description = "Nom du Vnet"
  type        = string
  default     = "vnet-dqa-calicot-cc-7"
}

# SUBNET WEB 

variable "subnet_name_web" {
  description = "Nom du Subnet"
  type        = string
  default     = "snet-qa-web-cc-7"
}

variable "subnet_prefixes_web" {
  default = ["10.0.1.0/24"]
}


# SUBNET DB


variable "subnet_name_db" {
  description = "Nom du Subnet"
  type        = string
  default     = "snet-qa-web-cc-7"
}

variable "subnet_prefixes_db" {
  default = ["10.0.2.0/24"]
}


# SQL SERVER

variable "sql_server_name" {
  description = "Nom du SQL Server"
  type        = string
  default     = "sql-calicot-qa-7"
}


# Key Vault

variable "key_vault_name" {
  description = "Nom du Key Vault"
  type        = string
  default     = "kv-calicot-qa-7"
}

variable "app_service_name" {
  description = "Nom du App Service"
  type        = string
  default     = "app-calicot-qa-7"
}

variable "web_app_name" {
  description = "Nom du Web App"
  type        = string
  default     = "app-calicot-qa-7"
}

variable "web_app_imageURL" {
  description = "URL de l'image"
  type        = string
  default     = "https://stcalicotprod000.blob.core.windows.net/images/"

}

variable "monitor_web_app_name" {
  description = "Nom du Monitor Web App"
  type        = string
  default     = "autoscale-calicot-qa-7"

}
