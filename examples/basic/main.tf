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
