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

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "azure_storage_container" {
  description = "Blob name"
  type        = string
  default     = "storage"
}

variable "location" {
  description = "Azure region"
}

variable "subnet_id" {
  description = "ID of the subnet for network rules"
}

variable "allow_public_access" {
  description = "Allow public access to the storage account during creation"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
