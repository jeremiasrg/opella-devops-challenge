resource "azurerm_storage_account" "storage" {
  name                     = lower("${var.project_prefix}${var.environment}${var.azure_storage_container}${random_string.suffix.result}")
  resource_group_name      = lower("${var.resource_group_name}")
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action = var.allow_public_access ? "Allow" : "Deny"
    virtual_network_subnet_ids = var.allow_public_access ? [] : [var.subnet_id]
  }
  tags = var.tags
}

resource "azurerm_storage_container" "container" {
  name                  = "storagedata"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}