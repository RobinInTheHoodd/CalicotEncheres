# Afficher l'URL de l'App Service
output "service_plan_id" {
  value = azurerm_app_service_plan.app_service_plan.id
  description =  "L'id du plan de service de l'App Service"
}

