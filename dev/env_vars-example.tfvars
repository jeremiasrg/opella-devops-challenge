# Credentials
azure_client_id     = ""
azure_client_secret = ""
azure_tenant_id     = ""
azure_subscription_id = ""

# Project
project_prefix        = "opc"
environment           = "dev"

# Location
location              = "eastus"

# Structure
resource_group_name   = "rg"


vnet_name             = "vnet"
vnet_address_space    = ["10.0.0.0/16"]


subnet_name           = "psubnet"
subnet_address_prefix = ["10.0.1.0/24"]

azure_storage_container = "storage"


vm_name               = "vm01"
vm_size               = "Standard_B1s"
admin_username        = "adminuser"
admin_password        = "P@ssw0rd123!"

tags = {
  "Environment" = "Development"
  "Project"     = "Opella Devops Challenge"
  "Owner"       = "Jeremy"
}
