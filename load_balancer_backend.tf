resource "azurerm_lb_backend_address_pool" "main" {
  count = length(var.lb_backend_address_pools)

  name            = var.lb_backend_address_pools[count.index].name
  loadbalancer_id = var.lb_backend_address_pools[count.index].loadbalancer_id

  # Optional attributes
  virtual_network_id = lookup(var.lb_backend_address_pools[count.index], "virtual_network_id", null)

  # Tunnel interfaces (optional and dynamic)
  dynamic "tunnel_interface" {
    for_each = lookup(var.lb_backend_address_pools[count.index], "tunnel_interface", [])

    content {
      identifier = tunnel_interface.value.identifier
      type       = tunnel_interface.value.type
      protocol   = tunnel_interface.value.protocol
      port       = tunnel_interface.value.port
    }
  }
}
