provider "azurerm" {
  features {}
}

resource "azurerm_windows_web_app" "az_win_web_app" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.app_service_plan_id
  site_config {
    always_on = false
    application_stack {
      current_stack     = var.web_app_current_stack
      node_version      = var.web_app_node_version
    }
  }
}
