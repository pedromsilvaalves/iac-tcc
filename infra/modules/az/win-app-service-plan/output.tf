output "az_app_service_plan_id" {
  description = "The ID of the Service Plan."
  value       = azurerm_service_plan.az_win_app_service_plan.id
}