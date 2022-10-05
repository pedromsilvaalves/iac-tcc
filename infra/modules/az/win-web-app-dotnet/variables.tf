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

variable "app_service_plan_id" {
  type = string
  description = "(required) the windows app service plan id"
}

// Web App

variable "web_app_name" {
  type = string
  description = "(required) web app name"
}

variable "web_app_current_stack" {
  type = string
  description = "(required) web app current stack (node, java, .net)"
  default = "dotnet"
}

variable "web_app_dotnet_version" {
  type = string
  description = "(Optional) The version of .NET to use when current_stack is set to dotnet."
  default = "v6.0"
}