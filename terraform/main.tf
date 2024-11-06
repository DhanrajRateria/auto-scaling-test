provider "azurerm" {
  features {}

  subscription_id = "815c7af9-39e1-491b-9391-4263d9962e52"
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "aksResourceGroup"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aksCluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "aksdns"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "standard_d2pds_v5"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_admin_config_raw
  sensitive = true
}
