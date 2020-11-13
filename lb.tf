
#Create Load Balancer
resource "azurerm_lb" "lb" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }
}

#Creating Backend Pool
resource "azurerm_lb_backend_address_pool" "backpool" {
  resource_group_name = azurerm_resource_group.rg.name
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "BackEndAddressPool"
}

#associate LB Backend Pool with NIC
resource "azurerm_network_interface_backend_address_pool_association" "example" {
  count                   = 2
  network_interface_id    = element(azurerm_network_interface.webvmnic[*].id, count.index)
  ip_configuration_name   = "webvmnic-ipconf"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backpool.id
}

/*
output "NIC_IP_Config" {
  value = azurerm_network_interface.vmnic.ip_configuration.name
}

*/

#Creating Health Probe
resource "azurerm_lb_probe" "lb_prob" {
  resource_group_name = azurerm_resource_group.rg.name
  loadbalancer_id     = azurerm_lb.lb.id
  name                = "web_health_Probe"
  port                = 80
}

#Creating Azure LB Rule
resource "azurerm_lb_rule" "lb_rule" {
  resource_group_name            = azurerm_resource_group.rg.name
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "LBRule"
  protocol                       = "tcp"
  frontend_port                  = 80
  backend_port                   = 80
  backend_address_pool_id        = azurerm_lb_backend_address_pool.backpool.id
  probe_id                       = azurerm_lb_probe.lb_prob.id
  frontend_ip_configuration_name = "PublicIPAddress"
}
