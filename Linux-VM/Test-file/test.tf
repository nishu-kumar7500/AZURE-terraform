provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "test" {
  name     = "today-rg"
  location = "central india"

  tags = {
    environment = "PROD"
    costcenter  = "123456"
    department  = "test"
  }
}


resource "azurerm_storage_account" "mysg" {
  name                     = "test75400"
  location                 = "central india"
  resource_group_name      = azurerm_resource_group.test.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on               = [azurerm_resource_group.test]

  tags = {
    costcenter  = "123456"
    department  = "FinOps"
    environment = "PROD"
  }


}

resource "azurerm_resource_group" "test1" {
  name     = "today-tomorrow"
  location = "central india"

  tags = {
    environment = "PROD"
    costcenter  = "123456"
    department  = "test"
  }
}
