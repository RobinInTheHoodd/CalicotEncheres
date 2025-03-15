variable "rg_name" {
  description = "Le nom du resource group"
  type        = string
}


variable "rg_location" {
  description = "la location du resource group"
  type        = string
}

variable "name" {
    description = "Le nom de l'app service plan"
    type        = string
}

variable "ImagesURL" {
  description = "L'url de l'image"
  type = string
}

variable "service_plan_id" {
  description = "L'id du service plan"
  type = string
}