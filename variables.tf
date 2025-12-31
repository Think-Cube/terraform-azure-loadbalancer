variable "environment" {
  description = "Environment name to differentiate resources (e.g., dev, prod)."
  type        = string
  default     = "dev"
}

variable "default_tags" {
  description = "Key-value tags to assign to all resources for identification."
  type        = map(any)
}

variable "region" {
  description = "Azure region where resources will be deployed (e.g., weu)."
  type        = string
  default     = "weu"
}

variable "resource_group_location" {
  description = "Location of the resource group. Changing this recreates the group."
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Name of the resource group. Changing this recreates the group."
  type        = string
}

variable "pip_sku" {
  description = "Public IP SKU. Possible values: Basic or Standard."
  type        = string
  default     = "Standard"
}

variable "lb_sku" {
  description = "Azure Load Balancer SKU. Values: Basic, Standard, or Gateway."
  type        = string
  default     = "Standard"
}

variable "pip_allocation_method" {
  description = "IP allocation method: Static or Dynamic."
  type        = string
  default     = "Static"
}

variable "public_ip_name" {
  description = "Name of the public IP address."
  type        = string
}

variable "use_public_ip" {
  description = "Whether to assign a public IP to the Load Balancer."
  type        = bool
  default     = true
}

variable "lb_zones" {
  description = "List of Availability Zones for the Load Balancer."
  type        = list(string)
  default     = []
}

variable "subnet_id" {
  description = "Subnet ID for an internal Load Balancer."
  type        = string
  default     = ""
}

variable "use_static_ip" {
  description = "Whether to use a static private IP."
  type        = bool
  default     = false
}

variable "private_ip_address" {
  description = "Private IP to assign if static IP is enabled."
  type        = string
  default     = ""
}

variable "ip_version" {
  description = "IP version to use: IPv4 or IPv6."
  type        = string
  default     = "IPv4"
}

variable "public_ip_prefix_id" {
  description = "Public IP Prefix ID to associate with the Load Balancer."
  type        = string
  default     = ""
}

variable "frontend_ip_config_name" {
  description = "Name of the frontend IP configuration."
  type        = string
  default     = "DynamicFrontendIPConfig"
}

variable "lb_name" {
  description = "Name of the Load Balancer."
  type        = string
  default     = "TestLoadBalancer"
}

variable "pip_enable_zones" {
  description = "Enable Availability Zones for the public IP."
  type        = bool
  default     = false
}

variable "pip_zones" {
  description = "List of Availability Zones for the public IP."
  type        = list(string)
  default     = []
}

variable "lb_rules" {
  description = "List of Load Balancer rules."
  type = list(object({
    name                           = string
    protocol                       = string
    frontend_port                  = number
    backend_port                   = number
    frontend_ip_configuration_name = string
    backend_address_pool_ids       = list(string)
    probe_id                       = string
    load_distribution              = string
    idle_timeout_in_minutes        = number
    enable_floating_ip             = bool
    disable_outbound_snat          = bool
  }))
  default = []
}

variable "lb_probes" {
  description = "List of Load Balancer probes."
  type = list(object({
    name                = string
    loadbalancer_id     = string
    protocol            = optional(string, "Tcp")
    port                = number
    probe_threshold     = optional(number, 1)
    request_path        = optional(string, null)
    interval_in_seconds = optional(number, 15)
    number_of_probes    = optional(number, 2)
  }))
  default = []
}

variable "lb_backend_address_pools" {
  description = "List of Load Balancer backend address pools."
  type = list(object({
    name               = string
    loadbalancer_id    = string
    virtual_network_id = optional(string, null)
    tunnel_interface = optional(list(object({
      identifier = string
      type       = string
      protocol   = string
      port       = number
    })), [])
  }))
  default = []
}

variable "lb_outbound_rules" {
  description = "List of Load Balancer outbound rules."
  type = list(object({
    name                     = string
    loadbalancer_id          = string
    backend_address_pool_id  = string
    protocol                 = string
    enable_tcp_reset         = optional(bool, false)
    allocated_outbound_ports = optional(number, 1024)
    idle_timeout_in_minutes  = optional(number, 4)
    frontend_ip_configuration = optional(list(object({
      name = string
    })), [])
  }))
  default = []
}