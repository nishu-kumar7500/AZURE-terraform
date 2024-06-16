resource "azurerm_network_security_group" "testnsg" {
  name                = "testnsg9891"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSHLinux"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
}
}

resource "azurerm_subnet_network_security_group_association" "testassociation" {
  subnet_id                 = azurerm_subnet.testsubnet.id
  network_security_group_id = azurerm_network_security_group.testnsg.id

  depends_on = [ azurerm_network_security_group.testnsg ]
}