# Example: Basic — Azure Loadbalancer

Provisions an Azure Load Balancer with frontend IP, backend pool and load balancing rules. Minimal example using required inputs only.

## Usage

```hcl
module "load_balancer" {
  source = "../.."

  resource_group_name     = "rg-example"
  resource_group_location = "West Europe"

  public_ip_name          = "pip-lb-example"
  lb_name                 = "lb-example"
  frontend_ip_config_name = "FrontendIPConfig"

  default_tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}
```