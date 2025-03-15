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

module "rg-calicot-web-dev" {
  source = "../../modules/ressource_group"

  name     = var.resource_group_name
  location = var.resource_group_location
}

module "rg-calicot-commun-001" {
  source = "../../modules/ressource_group"

  name     = var.resource_group_name_img_store
  location = var.resource_group_location
}


module "vnet" {
  source = "../../modules/virtual_network"

  rg_name     = module.rg-calicot-web-dev.name
  rg_location = module.rg-calicot-web-dev.location
}

module "subnet_web" {
  source = "../../modules/subnet"

  vnet_name       = module.vnet.name
  rg_name         = module.rg-calicot-web-dev.name
  subnet_name     = var.subnet_name_web
  subnet_prefixes = var.subnet_prefixes_web
}


module "subnet_db" {
  source = "../../modules/subnet"

  vnet_name       = module.vnet.name
  rg_name         = module.rg-calicot-web-dev.name
  subnet_name     = var.subnet_name_db
  subnet_prefixes = var.subnet_prefixes_db

}


module "sql_server" {
  source          = "../../modules/sql_server"
  rg_name         = module.rg-calicot-web-dev.name
  rg_location     = module.rg-calicot-web-dev.location
  sql_server_name = "sql-calicot-dev-7"
}


# Key vault 

module "key_vault" {
  source      = "../../modules/key_vault"
  name        = "kv-calicot-dev-7"
  rg_name     = module.rg-calicot-web-dev.name
  rg_location = module.rg-calicot-web-dev.location

}

module "app_service" {
  source      = "../../modules/app_service"
  name        = "plan-calicot-dev-7"
  rg_name     = module.rg-calicot-web-dev.name
  rg_location = module.rg-calicot-web-dev.location

}

module "web_app" {
  source = "../../modules/web_app"

  rg_name     = module.rg-calicot-web-dev.name
  rg_location = module.rg-calicot-web-dev.location
  name        = "app-calicot-dev-7"

  ImagesURL       = "https://stcalicotprod000.blob.core.windows.net/images/"
  service_plan_id = module.app_service.service_plan_id
}

module "monitor_web_app" {

  source = "../../modules/auto_scale"

  name               = "autoscale-calicot-dev-7"
  rg_name            = module.rg-calicot-web-dev.name
  rg_location        = module.rg-calicot-web-dev.location
  target_resource_id = module.app_service.service_plan_id
}
