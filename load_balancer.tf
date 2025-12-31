resource "azurerm_lb" "main" {
  name                = "${var.environment}-${var.lb_name}-${var.region}-lbe"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  sku                 = var.lb_sku
  tags                = var.default_tags

  frontend_ip_configuration {
    name = var.frontend_ip_config_name

    # Use public IP or public IP prefix if provided
    public_ip_address_id = var.use_public_ip ? azurerm_public_ip.main.id : null
    public_ip_prefix_id  = var.public_ip_prefix_id != "" ? var.public_ip_prefix_id : null

    # Availability Zones
    zones = length(var.lb_zones) > 0 ? var.lb_zones : null

    # Subnet and Private IP configuration (for internal LB)
    subnet_id                     = var.subnet_id != "" ? var.subnet_id : null
    private_ip_address            = var.use_static_ip && var.private_ip_address != "" ? var.private_ip_address : null
    private_ip_address_allocation = var.use_static_ip ? "Static" : "Dynamic"
    private_ip_address_version    = var.ip_version
  }
}