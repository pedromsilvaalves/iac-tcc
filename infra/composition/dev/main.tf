provider "azurerm" {
  features {}
}

// Resource Group
resource "azurerm_resource_group" "az_resouce_group" {
  name     = "todo-iac-rg-01"
  location = "East US"
}

// App Service Plan
resource "azurerm_service_plan" "az_win_app_service_plan" {
  name                = "todo-iac-app-service-plan-01"
  resource_group_name = "todo-iac-rg-01"
  location            = "East US"
  sku_name            = "F1"
  os_type             = "Windows"
  depends_on = [
    azurerm_resource_group.az_resouce_group
  ]
}

// Front-end
resource "azurerm_windows_web_app" "az_win_web_app" {
  name                = "todo-iac-ui-web-app-01"
  resource_group_name = "todo-iac-rg-01"
  location            = "East US"
  service_plan_id     = azurerm_service_plan.az_win_app_service_plan.id
  site_config {
    always_on = false
    application_stack {
      current_stack     = "node"
      node_version      = "16-LTS"
    }
  }

  depends_on = [
    azurerm_resource_group.az_resouce_group
  ]
}

// Back-end
resource "azurerm_windows_web_app" "az_win_web_app-todo_api" {
  name                = "todo-iac-api-web-app-01"
  resource_group_name = "todo-iac-rg-01"
  location            = "East US"
  service_plan_id     = azurerm_service_plan.az_win_app_service_plan.id
  site_config {
    always_on = false
    application_stack {
      current_stack     = "dotnet"
      dotnet_version    = "v6.0"
    }
  }

  depends_on = [
    azurerm_resource_group.az_resouce_group
  ]
}

// MSSQL Database
module "az_mssql_server_database" {
  source = "../../modules/az/mssql"

  // RG
  resource_group_name = "todo-iac-rg-01"
  location            = "East US"

  // MSSQL Server
  mssql_server_name = "todo-iac-mssql-server-02"
  mssql_server_administrator_login = "todo-iac-login"
  mssql_server_administrator_login_password = "Tod@Tcc01"

  // MSSQL Database
  mssql_database_name = "todo-iac-mssql-database-02"
  mssql_database_max_size_gb = 5
  mssql_database_sku_name = "S0"

  depends_on = [
    azurerm_resource_group.az_resouce_group
  ]
}