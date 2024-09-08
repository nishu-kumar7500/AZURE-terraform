provider "azurerm" {
  subscription_id = ""
  tenant_id       = ""
  client_id       = ""
  client_secret   = ""
  features {}
}

resource "azurerm_resource_group" "myrg" {
  name     = var.resource_group_name
  location = var.location
}