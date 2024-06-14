provider "azurerm" {
    subscription_id = "809eff35-137f-4411-9bef-83c5a1552808"
    tenant_id = "f4425336-4592-4d59-8bf1-b90a45179899"
    client_id = "d561c259-1acc-4a90-850c-b463d0aeedbf"
    client_secret = "3U68Q~N0SpEanCOQ-4rUjNNO614OIrYm5IxZhaDu"
    features {}
}

resource "azurerm_resource_group" "myrg" {
  name = var.resource_group_name
  location = var.location
}

/*resource "azurerm_storage_account" "example" {
  name                     = "test989180"
  resource_group_name      = "today-rg"
  location                 = "east us"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  depends_on = [ azurerm_resource_group.myrg ]
}*/