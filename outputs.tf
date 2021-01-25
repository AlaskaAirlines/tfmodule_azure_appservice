output "appserviceid" {
  value       = azurerm_app_service.appservice.id
  description = "The App Service Id"
}

output "default_site_hostname" {
  value       = azurerm_app_service.appservice.default_site_hostname
  description = "The Default Hostname associated with the App Service"
}

output "identity" {
  value       = azurerm_app_service.appservice.identity
  description = "The Identity block that contains the Managed Service Identity information for this App Service."
}
