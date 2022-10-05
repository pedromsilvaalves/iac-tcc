provider "azurerm" {
  features {}
}

resource "azurerm_service_plan" "az_win_app_service_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku                    
  os_type             = "Windows"                  // Hard-coded as it is a Windows WebApp
}