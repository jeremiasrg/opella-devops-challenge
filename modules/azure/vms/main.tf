terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0"
}

resource "azurerm_network_interface" "nic" {
  name                = lower("${var.project_prefix}-${var.environment}-${var.vm_name}nic")
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
  tags = var.tags
}

resource "azurerm_public_ip" "pip" {
  name                = lower("${var.project_prefix}-${var.environment}-${var.vm_name}pip")
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags = var.tags
}

# Virtual machine Linux
resource "azurerm_linux_virtual_machine" "vm" {
  name                = lower("${var.project_prefix}-${var.environment}-${var.vm_name}")
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  tags = var.tags
}