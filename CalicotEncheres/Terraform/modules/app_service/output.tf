# Afficher l'URL de l'App Service
output "web_app_url" {
  value = azurerm_app_service.webapp.default_site_hostname
  description = "L'URL de l'application Web Service"
}

# Afficher l'ID du plan de service d'application
output "app_service_plan_id" {
  value = azurerm_app_service_plan.plan.id
  description = "L'ID du plan de service d'application"
}

# Afficher l'ID du groupe de ressources
output "resource_group_id" {
  value = azurerm_resource_group.rg.id
  description = "L'ID du groupe de ressources"
}

# Afficher l'adresse IP publique si tu l'as configurée via un Load Balancer
output "public_ip" {
  value = azurerm_public_ip.lb_public_ip.ip_address
  description = "L'adresse IP publique de l'application Web"
}

# Afficher le nom du service App Service
output "app_service_name" {
  value = azurerm_app_service.webapp.name
  description = "Le nom du service App Service"
}
