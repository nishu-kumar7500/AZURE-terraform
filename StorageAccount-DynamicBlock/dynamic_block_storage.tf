
provider "azurerm" {
  subscription_id = ""
  tenant_id       = ""
  client_id       = ""
  client_secret   = ""
  features {}
}

# Define a resource group to house the storage accounts
resource "azurerm_resource_group" "test-rg" {
  name     = var.resource_group_name
  location = var.location
}

# Define the list of storage accounts to create
variable "storage_accounts" {
  type = list(object({
    name                     = string
    account_tier             = string
    account_replication_type = string
  }))
  default = [
    {
      name                     = "storageaccount1"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    },
    {
      name                     = "storageaccount2"
      account_tier             = "Standard"
      account_replication_type = "GRS"
    }
  ]
}

# Create Azure Storage Accounts using dynamic block
resource "azurerm_storage_account" "example" {
  for_each = { for sa in var.storage_accounts : sa.name => sa }

  name                     = each.value.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  tags = {
    environment = "dev"
  }
}

# Output the names of the storage accounts created
output "storage_account_names" {
  value = [for sa in azurerm_storage_account.example : sa.name]
}
