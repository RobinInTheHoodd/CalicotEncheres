resource "azurerm_key_vault" "key_vault" {
  name                        = var.name
  location                    = var.rg_location
  resource_group_name         = var.rg_name
  sku_name                    = "standard"
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days   = 7
  purge_protection_enabled     = false
}

data "azurerm_client_config" "current" {}