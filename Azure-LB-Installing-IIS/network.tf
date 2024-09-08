resource "azurerm_virtual_network" "testvn" {
  name                = "testvn7500"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_resource_group.myrg]
}

resource "azurerm_subnet" "testsubnet" {
  name                 = "testsubnet9891"
  resource_group_name  = var.resource_group_name
  virtual_network_name = "testvn7500"
  address_prefixes     = ["10.0.2.0/24"]
  depends_on           = [azurerm_virtual_network.testvn, azurerm_resource_group.myrg]
}

/*resource "azurerm_public_ip" "test_pip" {
  name                = "test-pip-1"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static" #  Ensures a dedicated IP address

  depends_on = [azurerm_resource_group.myrg]
}

resource "azurerm_public_ip" "test_pip2" {
  name                = "test-pip-2"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static" #  Ensures a dedicated IP address

  depends_on = [azurerm_resource_group.myrg]
}*/



resource "azurerm_network_interface" "testnic" {
  count               = var.number_of_machines
  name                = "test-nic${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.testsubnet.id
    private_ip_address_allocation = "Dynamic"
    #    public_ip_address_id          = azurerm_public_ip.test_pip.id
  }

  depends_on = [azurerm_virtual_network.testvn]
}

/*resource "azurerm_network_interface" "testnic2" {
  name                = "test-nic-2"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.testsubnet.id
    private_ip_address_allocation = "Dynamic"
    #    public_ip_address_id          = azurerm_public_ip.test_pip2.id
  }

  depends_on = [azurerm_virtual_network.testvn]
}*/