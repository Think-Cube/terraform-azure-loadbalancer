# Terraform Azure Load Balancer Module – Basic Example

This example demonstrates a **basic deployment** of a public Azure Load Balancer with one frontend IP, a backend pool, a health probe, and a load balancing rule.

## Description

- Creates a public Load Balancer with a dynamic frontend IP configuration
- Configures a backend address pool
- Adds a TCP health probe (port 80) and a load balancing rule
- Suitable for development or test environments

## Features

- Public IP frontend
- Backend address pool support
- Health probe and load balancing rule
- Configurable idle timeout and load distribution
- Optional floating IP and SNAT configuration
- Tags for resource identification

## Example Usage

```yml
module "lb_basic" {
  source = "../../"

  environment             = "dev"
  region                  = "weu"
  resource_group_name     = "rg-demo"
  lb_name                 = "demo-lb"
  public_ip_name          = "demo-lb-pip"
  frontend_ip_config_name = "frontendConfig"

  default_tags = {
    project = "demo"
    env     = "dev"
  }

  lb_backend_address_pools = [
    {
      name            = "backend-pool"
      loadbalancer_id = ""
    }
  ]

  lb_probes = [
    {
      name            = "http-probe"
      loadbalancer_id = ""
      port            = 80
    }
  ]

  lb_rules = [
    {
      name                           = "http-rule"
      protocol                       = "Tcp"
      frontend_port                  = 80
      backend_port                   = 80
      frontend_ip_configuration_name = "frontendConfig"
      backend_address_pool_ids       = []
      probe_id                       = ""
      load_distribution              = "Default"
      idle_timeout_in_minutes        = 4
      enable_floating_ip             = false
      disable_outbound_snat          = false
    }
  ]
}
```
