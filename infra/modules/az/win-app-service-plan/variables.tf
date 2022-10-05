// General
variable "resource_group_name" {
  type = string
  description = "(required) resource group name the app service is been deployed"
}

variable "location" {
  type = string
  description = "(required) azure region of the resources"
  default = "East US"
}

// App Service Plan

variable "app_service_plan_name" {
  type = string
  description = "(required) the windows app service plan name"
}

variable "sku" {
  type = string
  description = "(required) app service plan sku"
  default = "F1"
}
