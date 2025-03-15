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
  source = "./modules/resource_groups"

  name     = var.resource_group_name
  location = var.resource_group_location
}

module "vnet" {
  source      = "./modules/virtual_network"
  rg_name     = module.rg.name
  rg_location = module.rg.location
}

