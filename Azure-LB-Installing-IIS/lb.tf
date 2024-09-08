resource "azurerm_public_ip" "public-ip" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "test-lb" {
  name                = "TestLoadBalancer-7500"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "PublicIPAddress1"
    public_ip_address_id = azurerm_public_ip.public-ip.id
  }
  depends_on = [azurerm_public_ip.public-ip]
}

resource "azurerm_lb_backend_address_pool" "poolA" {
  loadbalancer_id = azurerm_lb.test-lb.id
  name            = "BackEndAddressPool-7500"
  depends_on      = [azurerm_lb.test-lb]
}

resource "azurerm_lb_backend_address_pool_address" "test-1" {
  count                   = var.number_of_machines
  name                    = "test-7500${count.index}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.poolA.id
  virtual_network_id      = azurerm_virtual_network.testvn.id
  ip_address              = azurerm_network_interface.testnic[count.index].private_ip_address
  depends_on              = [azurerm_lb_backend_address_pool.poolA, azurerm_network_interface.testnic]
}

resource "azurerm_lb_probe" "helth-prob" {
  loadbalancer_id = azurerm_lb.test-lb.id
  name            = "helth-prob-A"
  port            = 80
  protocol        = "Tcp"
  depends_on      = [azurerm_lb.test-lb]
}

resource "azurerm_lb_rule" "rule-A" {
  loadbalancer_id                = azurerm_lb.test-lb.id
  name                           = "rule-A"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress1"
  probe_id                       = azurerm_lb_probe.helth-prob.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.poolA.id]
  depends_on                     = [azurerm_lb.test-lb]
}

