provider "azurerm" {
    subscription_id = ""
    tenant_id = ""
    client_id = ""
    client_secret = ""
    features {}
}

resource "azurerm_resource_group" "myrg" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "mysg" {
  name                     = "test989180"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  blob_properties {
    versioning_enabled = true
  }

  depends_on = [ azurerm_resource_group.myrg ]
}

resource "azurerm_storage_container" "testcontainer" {
  name                  = "testcontainer7500"
  storage_account_name  = "test989180"
  container_access_type = "private"

  depends_on = [ azurerm_storage_account.mysg ]
}

resource "azurerm_storage_container" "testcontainer1" {
  name                  = "testcontainer9891"
  storage_account_name  = "test989180"
  container_access_type = "private"

  depends_on = [ azurerm_storage_account.mysg ]
}
