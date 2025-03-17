
resource "azurerm_resource_group" "rg" {
  name     = lower("${var.project_prefix}-${var.environment}-${var.resource_group_name}")
  location = var.location
  tags     = var.tags
}

module "network" {
  source                = "../modules/azure/network"
  project_prefix        = var.project_prefix
  environment           = var.environment
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  vnet_name             = var.vnet_name
  vnet_address_space    = var.vnet_address_space
  subnet_name           = var.subnet_name
  subnet_address_prefix = var.subnet_address_prefix
  tags                  = var.tags
  depends_on            = [azurerm_resource_group.rg]
}

module "storage" {
  source                = "../modules/azure/storage"
  project_prefix        = var.project_prefix
  environment           = var.environment
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  subnet_id             = module.network.subnet_id
  allow_public_access   = true
  tags                  = var.tags
  depends_on            = [azurerm_resource_group.rg]

}

module "vms" {
  source                = "../modules/azure/vms"
  project_prefix        = var.project_prefix
  environment           = var.environment
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  subnet_id             = module.network.subnet_id
  vm_name               = var.vm_name
  vm_size               = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  tags                  = var.tags
  depends_on            = [azurerm_resource_group.rg]
}

variable "project_prefix" {}
variable "environment" {}
variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}
variable "vnet_address_space" {}
variable "subnet_name" {}
variable "subnet_address_prefix" {}
variable "azure_storage_container" {}

variable "vm_name" {}
variable "vm_size" {}
variable "admin_username" {}
variable "admin_password" {}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}