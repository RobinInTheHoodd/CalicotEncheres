resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}