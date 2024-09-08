#The storage account will be used to store the script for Custom Script extension

resource "azurerm_storage_account" "test-gg" {
  name                     = "teststorage7500"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  depends_on = [
    azurerm_resource_group.myrg
  ]
}

resource "azurerm_storage_container" "data" {
  name                  = "data7500"
  storage_account_name  = "teststorage7500"
  container_access_type = "blob"
  depends_on = [
    azurerm_storage_account.test-gg
  ]
}

resource "azurerm_storage_blob" "IISConfig" {
  name                   = "IIS_Config.ps1"
  storage_account_name   = "teststorage7500"
  storage_container_name = "data7500"
  type                   = "Block"
  source                 = "IIS_Config.ps1"
  depends_on = [azurerm_storage_container.data,
  azurerm_storage_account.test-gg]
}

resource "azurerm_virtual_machine_extension" "vmextension" {
  count                = var.number_of_machines
  name                 = "appvm-extension${count.index}"
  virtual_machine_id   = azurerm_windows_virtual_machine.testmachine[count.index].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  settings             = <<SETTINGS
    {
       "fileUris": ["https://${azurerm_storage_account.test-gg.name}.blob.core.windows.net/data7500/IIS_Config.ps1"],
        "commandToExecute": "powershell -ExecutionPolicy Unrestricted -file IIS_Config.ps1"     
    }
  SETTINGS

}