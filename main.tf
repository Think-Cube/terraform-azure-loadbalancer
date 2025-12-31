# Azure load balancer module
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}