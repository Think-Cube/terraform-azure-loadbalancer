resource "azurerm_public_ip" "main" {
  name                = var.public_ip_name
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  allocation_method   = var.pip_allocation_method
  sku                 = var.pip_sku
  tags                = var.default_tags
  zones               = var.pip_enable_zones ? var.pip_zones : null
}