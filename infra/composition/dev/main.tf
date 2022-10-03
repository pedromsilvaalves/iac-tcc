provider "azurerm" {
  features {}
}

module "az_resource_group" {
  source = "../../modules/az/rg"

  resource_group_name = "todo-iac-rg"
  location = "East US"
}


// Front-end
module "az_win_web_app" {
  source = "../../modules/az/winwebapp"

  // General
  resource_group_name = "todo-iac-rg"
  location = "East US"
  
  // App Service Plan
  app_service_plan_name = "todo-iac-app-service-plan-01"
  sku = "Free"
  
  // Web App
  web_app_name = "todo-iac-ui-web-app-01"
  web_app_current_stack = "node"
  web_app_node_version = "16-LTS"
}

// Back-end
module "az_win_web_app" {
  source = "../../modules/az/winwebapp"

  // General
  resource_group_name = "todo-iac-rg"
  location = "East US"
  
  // App Service Plan
  app_service_plan_name = "todo-iac-app-service-plan-01"
  sku = "Free"
  
  // Web App
  web_app_name = "todo-iac-api-web-app-01"
  web_app_current_stack = "dotnet"
  web_app_dotnet_version = "v6.0"
}