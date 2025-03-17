# Basic variables
variable "azure_client_id" {
  description = "Client ID of the Service Principal"
  type        = string
  sensitive   = true
}

variable "azure_client_secret" {
  description = "Client Secret of the Service Principal"
  type        = string
  sensitive   = true
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  sensitive   = true
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}