variable "resource-group-name" {
  type        = string
  description = "Name of the resource group that exists in Azure"
}

variable "appName" {
  type        = string
  description = "The base name of the application used in the naming convention."
}

variable "environment" {
  type        = string
  description = "Name of the environment ex (Dev, Test, QA, Prod)"
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "appServicePlanId" {
  type        = string
  description = "The App Service Plan Id to run this App Service under"
}

variable "appType" {
  type        = string
  description = "Customizes the name of the resource with the type (eg. 'site' or 'api')"
}

variable "instrumentationKey" {
  type        = string
  description = "The App Insights Instrumentation Key is required to enable the logging for web apps."
}

variable "windows_fx_version" {
  type        = string
  description = "Only provide this when your plan is a Windows container. Leave this empty if you are wanting Linux containers or a standard windows service."
  default     = ""
}

variable "linux_fx_version" {
  type        = string
  description = "Only provide this when your plan is a Linux. Leave this empty if you are wanting Windows containers or a standard windows service."
  default     = ""
}

variable "appSettings" {
  type        = map(string)
  description = "Key: Value pairs"
  default     = {}
}

variable "ssoClientId" {
  type        = string
  description = "The SPN created for enabling SSO in Azure"
  default     = ""
}