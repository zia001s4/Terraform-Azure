
#create the Public IP for the Load Balancer
resource "azurerm_public_ip" "lb_pip" {
  name                = var.lb_pip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

#create the Public IP for the Web VM
resource "azurerm_public_ip" "web_vm_pip" {
  name                = var.web_vm_pip_name[count.index]
  count               = length(var.web_vm_name)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}


#create the Public IP for the DB VM
resource "azurerm_public_ip" "db_vm_pip" {
  name                = var.db_vm_pip_name[count.index]
  count               = length(var.db_vm_name)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}