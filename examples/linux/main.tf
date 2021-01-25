provider "azurerm" {
  features {}
}

module "actionGroup" {
  source = "github.com/AlaskaAirlines/tfmodule-azure-actiongroup.git?ref=v1.0.2"

  resource-group-name = var.resource-group-name
  appName             = var.appName
  environment         = var.environment
  shortName           = var.shortName
  enableEmail         = true
  emailName           = var.emailName
  emailAddress        = var.emailAddress
}

module "linuxPlan" {
  source = "github.com/AlaskaAirlines/tfmodule-azure-appserviceplan.git?ref=v1.0.0"

  resource-group-name   = var.resource-group-name
  appName               = var.appName
  environment           = var.environment
  location              = var.location
  kind                  = var.kind
  actionGroupId         = module.actionGroup.action_group_id
  autoScaleNotifyEmails = var.autoScaleNotifyEmails
}

module "appInsights" {
  source = "github.com/AlaskaAirlines/tfmodule-azure-applicationinsights.git?ref=v1.0.0"

  resource-group-name = var.resource-group-name
  appName             = var.appName
  environment         = var.environment
  location            = var.location
}

module "linuxWebApp" {
  source = "../../."

  resource-group-name = var.resource-group-name
  appName             = var.appName
  environment         = var.environment
  location            = var.location
  appServicePlanId    = module.linuxPlan.sharedplanids[0]
  appType             = var.appType
  instrumentationKey  = module.appInsights.instrumentation_key
  linux_fx_version    = var.runtime
}
