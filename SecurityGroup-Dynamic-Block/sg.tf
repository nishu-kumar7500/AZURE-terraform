provider "azurerm" {
  subscription_id = ""
  tenant_id       = ""
  client_id       = ""
  client_secret   = ""
  features {}
}

resource "azurerm_resource_group" "myrg" {
  name     = "today-rg"
  location = var.location
}


resource "azurerm_network_security_group" "allowport" {
  name                = "test-nsg7500"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_resource_group.myrg]
}

# Network Security Group rules using dynamic block
resource "azurerm_network_security_rule" "allowingress" {
  for_each = { for rule in var.ingress_rules : rule.name => rule }

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  network_security_group_name = azurerm_network_security_group.allowport.name
  resource_group_name         = var.resource_group_name
  depends_on                  = [azurerm_network_security_group.allowport]
}

# Network Security Group egress rules using dynamic block
resource "azurerm_network_security_rule" "alloweggress" {
  for_each = { for rule in var.egress_rules : rule.name => rule }

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  network_security_group_name = azurerm_network_security_group.allowport.name
  resource_group_name         = var.resource_group_name
  depends_on                  = [azurerm_network_security_group.allowport]
}