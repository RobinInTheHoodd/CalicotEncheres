
resource "azurerm_linux_web_app" "web_app" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name
  service_plan_id     = var.service_plan_id

  https_only = true

  site_config {
    always_on = true
  }

  app_settings = {
    "ImageUrl" = var.ImagesURL
  }

  identity {
    type = "SystemAssigned"
  }
}
