resource "azurerm_lb_probe" "main" {
  count = length(var.lb_probes)

  name                = var.lb_probes[count.index].name
  loadbalancer_id     = var.lb_probes[count.index].loadbalancer_id
  protocol            = lookup(var.lb_probes[count.index], "protocol", "Tcp")
  port                = var.lb_probes[count.index].port
  probe_threshold     = lookup(var.lb_probes[count.index], "probe_threshold", 1)
  request_path        = lookup(var.lb_probes[count.index], "request_path", null)
  interval_in_seconds = lookup(var.lb_probes[count.index], "interval_in_seconds", 15)
  number_of_probes    = lookup(var.lb_probes[count.index], "number_of_probes", 2)
}
