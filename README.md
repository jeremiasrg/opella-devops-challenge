# RESOLUTION - Opella DevOps Technical Challenge: Provision Azure Infrastructure with Terraform

### 1. Reusable Module Creation
**Task**: Create a Terraform module for provisioning an Azure VNET that can be reused across different setups.

- **Purpose**: This should deploy a VNET and related networking resources, designed with flexibility and security in mind.
- **Hints**:
  - Think about what configurations might need to change depending on where or how this is used.
    - `I created variables, like 'project_prefix' and 'environment' to separate the the created resources`
  - Consider optional features that could enhance network security.
    - `On the subnet I've added 'private_endpoint_network_policies' to enable suport a private endpoints and private_link_service_network_policies_enabled to ensure the services being private`.
    - `Also in the 'azurerm_network_security_group' I blocked the public access.`
  - What outputs you would add and why?
    - ` used in 'storage' and 'vms' modules ` 
  - What information would someone need in order to use this module? Bonus points if you automate documentation! (indicate how)
    - `Check the documentation` [here](/dev/README.md).
  - Super extra points if your module is tested


### 2. Infrastructure Setup

**Task**: Create a repository and a GitHub pipeline to deploy multiple environments in Azure using your VNET module, plus a couple of additional resources.

- **Folder Structure**: Set up your code to handle a `dev` environment in one Azure region (e.g., `eastus`), with an eye toward scaling to other environments and regions later.

- **Hints**:
  - Argument why would you use Resource Groups or Subscriptions for multiple environments.
    - `I prefer separete by subscriptions, check the list bellow`
      - `Create scripts to stop or clear all resources in the end of the day only for dev with low risk.`
      - `Separate cost by environment`
      - `Create strict policies only for production if necessary`
  - Include a virtual machine and one other resources (your choice—think about what’s useful in a dev setup).
    - `I've created a module to put all vms configurations. see` [here](/modules/azure/vms)
  - Name and label resources to make the environment and region clear.
    - `Concatenate environment and project_prefix`
  - Avoid repeating values—how can you make this flexible?
  - How might you label resources for better tracking? How would you enforce this?
    - `Create tags to track the objects`
  - What outputs might be useful and why?
  - Bonus points if you build a GitHub pipeline and explain the release lifecycle.
