## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.66.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.66.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.66.0/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.66.0/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_outbound_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.66.0/docs/resources/lb_outbound_rule) | resource |
| [azurerm_lb_probe.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.66.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.66.0/docs/resources/lb_rule) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.66.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.66.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Key-value tags to assign to all resources for identification. | `map(any)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name to differentiate resources (e.g., dev, prod). | `string` | `"dev"` | no |
| <a name="input_frontend_ip_config_name"></a> [frontend\_ip\_config\_name](#input\_frontend\_ip\_config\_name) | Name of the frontend IP configuration. | `string` | `"DynamicFrontendIPConfig"` | no |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | IP version to use: IPv4 or IPv6. | `string` | `"IPv4"` | no |
| <a name="input_lb_backend_address_pools"></a> [lb\_backend\_address\_pools](#input\_lb\_backend\_address\_pools) | List of Load Balancer backend address pools. | <pre>list(object({<br/>    name               = string<br/>    loadbalancer_id    = string<br/>    virtual_network_id = optional(string, null)<br/>    tunnel_interface = optional(list(object({<br/>      identifier = string<br/>      type       = string<br/>      protocol   = string<br/>      port       = number<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | Name of the Load Balancer. | `string` | `"TestLoadBalancer"` | no |
| <a name="input_lb_outbound_rules"></a> [lb\_outbound\_rules](#input\_lb\_outbound\_rules) | List of Load Balancer outbound rules. | <pre>list(object({<br/>    name                     = string<br/>    loadbalancer_id          = string<br/>    backend_address_pool_id  = string<br/>    protocol                 = string<br/>    enable_tcp_reset         = optional(bool, false)<br/>    allocated_outbound_ports = optional(number, 1024)<br/>    idle_timeout_in_minutes  = optional(number, 4)<br/>    frontend_ip_configuration = optional(list(object({<br/>      name = string<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_lb_probes"></a> [lb\_probes](#input\_lb\_probes) | List of Load Balancer probes. | <pre>list(object({<br/>    name                = string<br/>    loadbalancer_id     = string<br/>    protocol            = optional(string, "Tcp")<br/>    port                = number<br/>    probe_threshold     = optional(number, 1)<br/>    request_path        = optional(string, null)<br/>    interval_in_seconds = optional(number, 15)<br/>    number_of_probes    = optional(number, 2)<br/>  }))</pre> | `[]` | no |
| <a name="input_lb_rules"></a> [lb\_rules](#input\_lb\_rules) | List of Load Balancer rules. | <pre>list(object({<br/>    name                           = string<br/>    protocol                       = string<br/>    frontend_port                  = number<br/>    backend_port                   = number<br/>    frontend_ip_configuration_name = string<br/>    backend_address_pool_ids       = list(string)<br/>    probe_id                       = string<br/>    load_distribution              = string<br/>    idle_timeout_in_minutes        = number<br/>    enable_floating_ip             = bool<br/>    disable_outbound_snat          = bool<br/>  }))</pre> | `[]` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | Azure Load Balancer SKU. Values: Basic, Standard, or Gateway. | `string` | `"Standard"` | no |
| <a name="input_lb_zones"></a> [lb\_zones](#input\_lb\_zones) | List of Availability Zones for the Load Balancer. | `list(string)` | `[]` | no |
| <a name="input_pip_allocation_method"></a> [pip\_allocation\_method](#input\_pip\_allocation\_method) | IP allocation method: Static or Dynamic. | `string` | `"Static"` | no |
| <a name="input_pip_enable_zones"></a> [pip\_enable\_zones](#input\_pip\_enable\_zones) | Enable Availability Zones for the public IP. | `bool` | `false` | no |
| <a name="input_pip_sku"></a> [pip\_sku](#input\_pip\_sku) | Public IP SKU. Possible values: Basic or Standard. | `string` | `"Standard"` | no |
| <a name="input_pip_zones"></a> [pip\_zones](#input\_pip\_zones) | List of Availability Zones for the public IP. | `list(string)` | `[]` | no |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | Private IP to assign if static IP is enabled. | `string` | `""` | no |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | Name of the public IP address. | `string` | n/a | yes |
| <a name="input_public_ip_prefix_id"></a> [public\_ip\_prefix\_id](#input\_public\_ip\_prefix\_id) | Public IP Prefix ID to associate with the Load Balancer. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | Azure region where resources will be deployed (e.g., weu). | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group. Changing this recreates the group. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group. Changing this recreates the group. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID for an internal Load Balancer. | `string` | `""` | no |
| <a name="input_use_public_ip"></a> [use\_public\_ip](#input\_use\_public\_ip) | Whether to assign a public IP to the Load Balancer. | `bool` | `true` | no |
| <a name="input_use_static_ip"></a> [use\_static\_ip](#input\_use\_static\_ip) | Whether to use a static private IP. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_backend_address_pool_details"></a> [lb\_backend\_address\_pool\_details](#output\_lb\_backend\_address\_pool\_details) | Details of the Load Balancer Backend Address Pools |
| <a name="output_lb_backend_address_pool_ids"></a> [lb\_backend\_address\_pool\_ids](#output\_lb\_backend\_address\_pool\_ids) | The IDs of the Load Balancer Backend Address Pools |
| <a name="output_load_balancer_frontend_ip_configuration_ids"></a> [load\_balancer\_frontend\_ip\_configuration\_ids](#output\_load\_balancer\_frontend\_ip\_configuration\_ids) | The IDs of the Load Balancer frontend IP configurations |
| <a name="output_load_balancer_id"></a> [load\_balancer\_id](#output\_load\_balancer\_id) | The ID of the Load Balancer |
| <a name="output_load_balancer_outbound_rule_ids"></a> [load\_balancer\_outbound\_rule\_ids](#output\_load\_balancer\_outbound\_rule\_ids) | The IDs of the Load Balancer Outbound Rules |
| <a name="output_load_balancer_outbound_rules"></a> [load\_balancer\_outbound\_rules](#output\_load\_balancer\_outbound\_rules) | Detailed information about the Load Balancer Outbound Rules |
| <a name="output_load_balancer_probe_details"></a> [load\_balancer\_probe\_details](#output\_load\_balancer\_probe\_details) | Details of the Load Balancer probes |
| <a name="output_load_balancer_probe_ids"></a> [load\_balancer\_probe\_ids](#output\_load\_balancer\_probe\_ids) | The IDs of the Load Balancer probes |
| <a name="output_load_balancer_rules"></a> [load\_balancer\_rules](#output\_load\_balancer\_rules) | A list of Load Balancer rules with their details |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | The IP address of the Public IP |
| <a name="output_public_ip_id"></a> [public\_ip\_id](#output\_public\_ip\_id) | The ID of the Public IP |
| <a name="output_public_ip_prefix_id"></a> [public\_ip\_prefix\_id](#output\_public\_ip\_prefix\_id) | The ID of the Public IP Prefix, if used |
