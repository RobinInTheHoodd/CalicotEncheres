resource "azurerm_network_security_group" "nsg" {
  name                = var.net_name
  location            = var.rg_location
  resource_group_name = var.rg_name
}