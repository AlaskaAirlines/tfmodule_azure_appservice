locals {
  baseName                      = "${var.appName}-${var.environment}-${var.appType}"
  appsettingsInstrumentationKey = { "APPINSIGHTS_INSTRUMENTATIONKEY" = var.instrumentationKey }
}


data "azurerm_resource_group" "rg" {
  name = var.resource-group-name
}

resource "azurerm_app_service" "appservice" {
  name                = "${local.baseName}-${var.location}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  app_service_plan_id = var.appServicePlanId
  tags                = data.azurerm_resource_group.rg.tags


  dynamic "site_config" {
    for_each = var.linux_fx_version != "" ? ["site_config"] : []
    content {
      linux_fx_version = var.linux_fx_version
    }
  }

  dynamic "site_config" {
    for_each = var.windows_fx_version != "" ? ["site_config"] : []
    content {
      windows_fx_version = var.windows_fx_version
    }
  }

  # Enables the use of Key Vault Secrets
  identity {
    type = "SystemAssigned"
  }

  app_settings = merge(local.appsettingsInstrumentationKey, var.appSettings)

  dynamic "auth_settings" {
    for_each = var.ssoClientId != "" ? ["auth_settings"] : []
    content {
      enabled             = true
      token_store_enabled = false
      active_directory {
        client_id = var.ssoClientId
      }
    }
  }
}