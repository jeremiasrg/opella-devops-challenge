terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"
}


resource "azurerm_virtual_network" "vnet" {
  name                = lower("${var.project_prefix}-${var.environment}-${var.vnet_name}")
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

resource "azurerm_subnet" "private_subnet" {
  name                 = lower("${var.project_prefix}-${var.environment}-${var.subnet_name}")
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefix

  service_endpoints    = ["Microsoft.Storage"]
  # Config for privacy
  private_endpoint_network_policies = "Enabled" # Enable Private Endpoints
  private_link_service_network_policies_enabled = true  # Ensure the private services
}

resource "azurerm_network_security_group" "nsg" {
  name                = lower("${var.project_prefix}-${var.environment}nsg")
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "deny-inbound-public"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = azurerm_subnet.private_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}