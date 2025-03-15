resource "azurerm_resource_group" "calicot" {
  name     = "rg-calicot-dev-${var.code_identification}"
  location = "Canada Central"
}

resource "azurerm_app_service_plan" "plan" {
  name                = "webapp-service-plan"
  location            = "Canada Central"
  resource_group_name = "rg-calicot-dev-${var.code_identification}"
  kind                = "App"
  reserved            = true # Linux apps

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service_plan" "calicot" {
  name                = "plan-calicot-dev-${var.code_identification}"
  location            = "azurerm_resource_group.calicot.location"
  resource_group_name = var.rg_name
  kind                = "App"

  sku {
    tier = "Standard"
    size = "S1"
  }
}


# Web App (App Service)
resource "azurerm_app_service" "webapp" {
  name                = "webapp-service"
  location            = "Canada Central"
  resource_group_name = "rg-calicot-dev-${var.code_identification}"
  app_service_plan_id = azurerm_app_service_plan.calicot.id

  site_config {
    always_on     = true # Empêche la mise en veille
    http2_enabled = true # Active HTTP/2
  }

  app_settings = {
    "SOME_KEY" = "some_value"
  }
}

