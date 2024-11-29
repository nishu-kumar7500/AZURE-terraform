provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "myrg" {
  name     = "today-rg"
  location = var.location
}

resource "random_string" "random" {
  length           = 16
  special          = false
  upper            = false
  lower            = true
  override_special = "nishu"
}

resource "azurerm_storage_account" "mystorage" {
  name                     = "test${random_string.random.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

output "storage_account_name" {
  value = azurerm_storage_account.mystorage.name
}