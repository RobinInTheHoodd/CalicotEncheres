terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

module "rg" {
  source = "../../module/ressource_group"

  name     = var.resource_group_name
  location = var.resource_group_location
}

module "vnet" {
  source = "./modules/virtual_network"

  rg_name     = module.rg.name
  rg_location = module.rg.location
}

module "subnet_web" {
  source = "../../modules/subnet"

  vnet_name       = module.vnet.name
  rg_name         = module.rg.name
  subnet_name     = var.subnet_name_web
  subnet_prefixes = var.subnet_prefixes_web
}


module "subnet_db" {
  source = "../../modules/subnet"

  vnet_name       = module.vnet.name
  rg_name         = module.rg.name
  subnet_name     = var.subnet_name_db
  subnet_prefixes = var.subnet_prefixes_db

}
