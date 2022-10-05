output "az_app_service_plan_id" {
  description = "The ID of the Service Plan."
  value       = azurerm_service_plan.az_win_app_service_plan.id
}

output "az_win_web_app_id" {
  description = "The ID of the Windows Web App."
  value       = azurerm_windows_web_app.az_win_web_app.id
}

output "az_win_web_app_default_hostname" {
  description = "The default hostname of the Windows Web App."
  value       = azurerm_windows_web_app.az_win_web_app.default_hostname
}