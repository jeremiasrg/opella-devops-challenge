variable "environment" { 
  description = "Environment name (e.g., dev, prod)"
  type        = string
}

variable "project_prefix" {
  description = "Project prefix"
}

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region"
}

variable "subnet_id" {
  description = "ID of the subnet for the VM"
}

variable "vm_name" {
  description = "Name of the virtual machine"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  default     = "Standard_B1s"  # Pequena e barata, ideal para dev
}

variable "admin_username" {
  description = "Admin username for the VM"
}

variable "admin_password" {
  description = "Admin password for the VM"
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}