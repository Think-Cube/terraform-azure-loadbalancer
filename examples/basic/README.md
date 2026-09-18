# Example: Basic -- Azure Load Balancer

Deploys a Standard public Load Balancer with a public IP.

```hcl
module "load_balancer" {
  source = "github.com/Think-Cube/terraform-azure-loadbalancer?ref=v1.0.0"

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