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

resource "azurerm_windows_web_app" "az_win_web_app" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.az_win_app_service_plan.id
  application_stack {
    current_stack     = var.web_app_current_stack
    node_version      = var.web_app_node_version
    dotnet_version    = var.web_app_dotnet_version
  }
  site_config {}
}
