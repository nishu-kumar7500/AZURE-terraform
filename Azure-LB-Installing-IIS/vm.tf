resource "azurerm_windows_virtual_machine" "testmachine" {
  count               = var.number_of_machines
  name                = "testmachine-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "Sanjay456#.com"
  network_interface_ids = [
    azurerm_network_interface.testnic[count.index].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  #user_data = base64encode(file("IIS_Config.ps1"))
}

/*resource "azurerm_windows_virtual_machine" "testmachine2" {
  name                = "testmachine-2"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "Sanjay456#.com"
  network_interface_ids = [
    azurerm_network_interface.testnic2.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}*/