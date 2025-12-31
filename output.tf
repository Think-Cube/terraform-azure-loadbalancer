output "load_balancer_id" {
  description = "The ID of the Load Balancer"
  value       = azurerm_lb.main.id
}

output "load_balancer_frontend_ip_configuration_ids" {
  description = "The IDs of the Load Balancer frontend IP configurations"
  value = [
    for config in azurerm_lb.main.frontend_ip_configuration :
    config.id
  ]
}

output "public_ip_id" {
  description = "The ID of the Public IP"
  value       = azurerm_public_ip.main.id
}

output "public_ip_address" {
  description = "The IP address of the Public IP"
  value       = azurerm_public_ip.main.ip_address
}

output "public_ip_prefix_id" {
  description = "The ID of the Public IP Prefix, if used"
  value       = azurerm_public_ip.main.public_ip_prefix_id
}

output "load_balancer_rules" {
  description = "A list of Load Balancer rules with their details"
  value = [
    for rule in azurerm_lb_rule.main :
    {
      name                           = rule.name
      protocol                       = rule.protocol
      frontend_port                  = rule.frontend_port
      backend_port                   = rule.backend_port
      frontend_ip_configuration_name = rule.frontend_ip_configuration_name
      backend_address_pool_ids       = rule.backend_address_pool_ids
      probe_id                       = rule.probe_id
      load_distribution              = rule.load_distribution
      idle_timeout_in_minutes        = rule.idle_timeout_in_minutes
      enable_floating_ip             = rule.enable_floating_ip
      disable_outbound_snat          = rule.disable_outbound_snat
    }
  ]
}
output "load_balancer_probe_ids" {
  description = "The IDs of the Load Balancer probes"
  value = [
    for probe in azurerm_lb_probe.main : probe.id
  ]
}


output "load_balancer_probe_details" {
  description = "Details of the Load Balancer probes"
  value = [
    for probe in azurerm_lb_probe.main :
    {
      name                = probe.name
      id                  = probe.id
      protocol            = probe.protocol
      port                = probe.port
      probe_threshold     = probe.probe_threshold
      request_path        = probe.request_path
      interval_in_seconds = probe.interval_in_seconds
      number_of_probes    = probe.number_of_probes
    }
  ]
}
output "lb_backend_address_pool_ids" {
  description = "The IDs of the Load Balancer Backend Address Pools"
  value = [
    for pool in azurerm_lb_backend_address_pool.main : pool.id
  ]
}

output "lb_backend_address_pool_details" {
  description = "Details of the Load Balancer Backend Address Pools"
  value = [
    for pool in azurerm_lb_backend_address_pool.main :
    {
      name               = pool.name
      id                 = pool.id
      virtual_network_id = pool.virtual_network_id
      tunnel_interfaces = [
        for ti in pool.tunnel_interface :
        {
          identifier = ti.identifier
          type       = ti.type
          protocol   = ti.protocol
          port       = ti.port
        }
      ]
    }
  ]
}
output "load_balancer_outbound_rule_ids" {
  description = "The IDs of the Load Balancer Outbound Rules"
  value = [
    for rule in azurerm_lb_outbound_rule.main : rule.id
  ]
}

output "load_balancer_outbound_rules" {
  description = "Detailed information about the Load Balancer Outbound Rules"
  value = [
    for rule in azurerm_lb_outbound_rule.main : {
      name                     = rule.name
      id                       = rule.id
      backend_address_pool_id  = rule.backend_address_pool_id
      protocol                 = rule.protocol
      enable_tcp_reset         = rule.enable_tcp_reset
      allocated_outbound_ports = rule.allocated_outbound_ports
      idle_timeout_in_minutes  = rule.idle_timeout_in_minutes
      frontend_ip_configurations = [
        for config in rule.frontend_ip_configuration : {
          name = config.name
        }
      ]
    }
  ]
}
