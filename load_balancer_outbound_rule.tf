resource "azurerm_lb_outbound_rule" "main" {
  count = length(var.lb_outbound_rules)

  name                     = var.lb_outbound_rules[count.index].name
  loadbalancer_id          = var.lb_outbound_rules[count.index].loadbalancer_id
  backend_address_pool_id  = var.lb_outbound_rules[count.index].backend_address_pool_id
  protocol                 = var.lb_outbound_rules[count.index].protocol
  enable_tcp_reset         = lookup(var.lb_outbound_rules[count.index], "enable_tcp_reset", false)
  allocated_outbound_ports = lookup(var.lb_outbound_rules[count.index], "allocated_outbound_ports", 1024)
  idle_timeout_in_minutes  = lookup(var.lb_outbound_rules[count.index], "idle_timeout_in_minutes", 4)

  dynamic "frontend_ip_configuration" {
    for_each = lookup(var.lb_outbound_rules[count.index], "frontend_ip_configuration", [])

    content {
      name = frontend_ip_configuration.value.name
    }
  }
}
