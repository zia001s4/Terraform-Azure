#create Availability set For Web
resource "azurerm_availability_set" "avsetweb" {
  name                         = var.avset_name_web
  location                     = var.location
  resource_group_name          = azurerm_resource_group.rg.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true

  tags = {
    environment = "Dev_Web_Server"
  }
}


#create Availability set for Database.
resource "azurerm_availability_set" "avsetdb" {
  name                         = var.avset_name_db
  location                     = var.location
  resource_group_name          = azurerm_resource_group.rg.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true

  tags = {
    environment = "Dev_DB_Server"
  }
}