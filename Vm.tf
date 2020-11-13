
#create the resource group
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

#create the network interface for the Web VM
resource "azurerm_network_interface" "webvmnic" {
  count               = length(var.web_vm_name)
  name                = "webvmnic${count.index}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "webvmnic-ipconf"
    subnet_id                     = element(azurerm_subnet.subnet[*].id, count.index)
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.web_vm_pip[*].id, count.index)
  }
}

#create the network interface for the DB VM
resource "azurerm_network_interface" "dbvmnic" {
  count               = length(var.db_vm_name)
  name                = "dbvmnic${count.index}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "dbvmnic-ipconf"
    subnet_id                     = element(azurerm_subnet.subnet[*].id, count.index)
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.db_vm_pip[*].id, count.index)
  }
}


##create the Random Password for VM Login
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@!*%$#^)("
}

output "Password" {
  value = random_password.password.result
}



##create the actual web VM
resource "azurerm_windows_virtual_machine" "webvm" {
  count                 = 2
  name                  = var.web_vm_name[count.index]
  location              = var.location
  size                  = var.web_vm_size
  admin_username        = element (var.user_name, count.index)
  admin_password        = random_password.password.result
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [element(azurerm_network_interface.webvmnic.*.id, count.index)]
  availability_set_id   = azurerm_availability_set.avsetweb.id

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


}

##create the actual VM
resource "azurerm_windows_virtual_machine" "dbvm" {
  count                 = 2
  name                  = var.db_vm_name[count.index]
  location              = var.location
  size                  = var.db_vm_size
  admin_username        = element (var.user_name, count.index)
  admin_password        = random_password.password.result
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [element(azurerm_network_interface.dbvmnic.*.id, count.index)]
  availability_set_id   = azurerm_availability_set.avsetdb.id

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


}


##end creating VM