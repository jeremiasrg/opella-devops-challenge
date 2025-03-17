variable "project_prefix" {
  description = "Project prefix"
}

variable "environment" {
  description = "Environment (dev, pre, pro)"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "pre", "pro"], var.environment)
    error_message = "The environment must be 'dev', 'pre', or 'pro'."
  }
}


# Structure variables
variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "subnet_name" {
  description = "Subnet name"
}

variable "subnet_address_prefix" {
  description = "Subnet address prefix "
}

variable "location" {
  description = "Azure region"
}

variable "vnet_name" {
  description = "Name of the VNET"
}

variable "vnet_address_space" {
  description = "Address space of the VNET"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}