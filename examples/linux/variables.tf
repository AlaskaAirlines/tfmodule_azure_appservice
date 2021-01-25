variable "resource-group-name" {
  type = string
}

variable "appName" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "shortName" {
  type = string
}

variable "emailName" {
  type = string
}

variable "emailAddress" {
  type = string
}

variable "kind" {
  type = string
}

variable "autoScaleNotifyEmails" {
  type = list(string)
}

variable "appType" {
  type = string
}

variable "runtime" {
  type = string
}