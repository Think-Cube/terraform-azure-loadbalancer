module "load_balancer" {
  source = "github.com/Think-Cube/terraform-azure-loadbalancer?ref=v1.0.0"

  resource_group_name     = "rg-example"
  resource_group_location = "West Europe"

  public_ip_name          = "pip-lb-example-adv"
  lb_name                 = "lb-example-adv"
  frontend_ip_config_name = "FrontendIPConfig"
  lb_sku                  = "Standard"
  pip_sku                 = "Standard"
  pip_enable_zones        = true
  pip_zones               = ["1", "2", "3"]

  lb_probes = [
    {
      name            = "probe-http"
      loadbalancer_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Network/loadBalancers/lb-example-adv"
      protocol        = "Http"
      port            = 80
      request_path    = "/health"
    }
  ]

  lb_backend_address_pools = [
    {
      name            = "backend-pool"
      loadbalancer_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Network/loadBalancers/lb-example-adv"
    }
  ]

  lb_rules = [
    {
      name                           = "rule-http"
      protocol                       = "Tcp"
      frontend_port                  = 80
      backend_port                   = 80
      frontend_ip_configuration_name = "FrontendIPConfig"
      backend_address_pool_ids       = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Network/loadBalancers/lb-example-adv/backendAddressPools/backend-pool"]
      probe_id                       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Network/loadBalancers/lb-example-adv/probes/probe-http"
      load_distribution              = "Default"
      idle_timeout_in_minutes        = 4
      floating_ip_enabled            = false
      disable_outbound_snat          = true
    },
    {
      name                           = "rule-https"
      protocol                       = "Tcp"
      frontend_port                  = 443
      backend_port                   = 443
      frontend_ip_configuration_name = "FrontendIPConfig"
      backend_address_pool_ids       = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Network/loadBalancers/lb-example-adv/backendAddressPools/backend-pool"]
      probe_id                       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Network/loadBalancers/lb-example-adv/probes/probe-http"
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