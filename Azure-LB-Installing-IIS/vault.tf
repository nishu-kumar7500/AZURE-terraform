/*data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "testvault" {
  name                        = "testvault9891"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "Create",
      "Delete",
      "List",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "List",
    ]
  }

  depends_on = [ azurerm_resource_group.myrg ]
}

resource "azurerm_key_vault_secret" "secret" {
  name         = "secret9891"
  value        = "Nishu@7500"
  key_vault_id = azurerm_key_vault.testvault.id
  depends_on = [ azurerm_key_vault.testvault ]
}*/