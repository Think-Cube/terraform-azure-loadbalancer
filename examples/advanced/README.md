# Example: Advanced -- Azure Load Balancer

Deploys a Standard Load Balancer with zone-redundant public IP, health probe, backend pool and two LB rules (HTTP and HTTPS with floating_ip_enabled).

```hcl
module "load_balancer" {
  source = "github.com/Think-Cube/terraform-azure-loadbalancer?ref=v1.0.0"

  resource_group_name     = "rg-example"
  resource_group_location = "West Europe"

  public_ip_name          = "pip-lb-example-adv"
  lb_name                 = "lb-example-adv"
  frontend_ip_config_name = "FrontendIPConfig"
  lb_sku                  = "Standard"
  pip_enable_zones        = true
  pip_zones               = ["1", "2", "3"]

  lb_rules = [
    {
      name                           = "rule-https"
      protocol                       = "Tcp"
      frontend_port                  = 443
      backend_port                   = 443
      frontend_ip_configuration_name = "FrontendIPConfig"
      backend_address_pool_ids       = ["/subscriptions/.../backendAddressPools/backend-pool"]
      probe_id                       = "/subscriptions/.../probes/probe-http"
      load_distribution              = "Default"
      idle_timeout_in_minutes        = 4
      floating_ip_enabled            = true
      disable_outbound_snat          = true
    }
  ]

  default_tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_load_balancer"></a> [load\_balancer](#module\_load\_balancer) | github.com/Think-Cube/terraform-azure-loadbalancer | v1.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->