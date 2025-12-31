terraform {
  required_version = ">= 1.6.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "lb_advanced" {
  source = "../../"

  environment             = "prod"
  region                  = "weu"
  resource_group_name     = "rg-prod"
  lb_name                 = "internal-lb"
  use_public_ip           = false
  subnet_id               = "/subscriptions/xxxx/resourceGroups/rg-prod/providers/Microsoft.Network/virtualNetworks/vnet-prod/subnets/subnet-backend"
  use_static_ip           = true
  private_ip_address      = "10.10.1.10"
  frontend_ip_config_name = "internalFrontend"

  default_tags = {
    project = "core"
    env     = "prod"
  }

  lb_backend_address_pools = [
    {
      name            = "backend-pool"
      loadbalancer_id = ""
    }
  ]

  lb_outbound_rules = [
    {
      name                     = "outbound-rule"
      loadbalancer_id          = ""
      backend_address_pool_id  = ""
      protocol                 = "All"
      allocated_outbound_ports = 2048
      idle_timeout_in_minutes  = 10
      frontend_ip_configuration = [
        { name = "internalFrontend" }
      ]
    }
  ]

  lb_probes = [
    {
      name            = "https-probe"
      loadbalancer_id = ""
      protocol        = "Tcp"
      port            = 443
    }
  ]

  lb_rules = [
    {
      name                           = "https-rule"
      protocol                       = "Tcp"
      frontend_port                  = 443
      backend_port                   = 443
      frontend_ip_configuration_name = "internalFrontend"
      backend_address_pool_ids       = []
      probe_id                       = ""
      load_distribution              = "Default"
      idle_timeout_in_minutes        = 10
      enable_floating_ip             = false
      disable_outbound_snat          = false
    }
  ]
}
