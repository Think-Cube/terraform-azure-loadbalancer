resource "azurerm_lb_rule" "main" {
  count = length(var.lb_rules)

  loadbalancer_id                = azurerm_lb.main.id
  name                           = var.lb_rules[count.index].name
  protocol                       = var.lb_rules[count.index].protocol
  frontend_port                  = var.lb_rules[count.index].frontend_port
  backend_port                   = var.lb_rules[count.index].backend_port
  frontend_ip_configuration_name = var.lb_rules[count.index].frontend_ip_configuration_name
  backend_address_pool_ids       = var.lb_rules[count.index].backend_address_pool_ids
  probe_id                       = var.lb_rules[count.index].probe_id
  load_distribution              = var.lb_rules[count.index].load_distribution
  idle_timeout_in_minutes        = var.lb_rules[count.index].idle_timeout_in_minutes
  enable_floating_ip             = var.lb_rules[count.index].enable_floating_ip
  disable_outbound_snat          = var.lb_rules[count.index].disable_outbound_snat
}
