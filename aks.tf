provider "azurerm" {
  features {}
    subscription_id = "a2b28c85-1948-4263-90ca-bade2bac4df4"
    resource_provider_registrations = "none"
    use_msi = false
    use_cli = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-minimal-cluster"
  location            = "East US"                      # Use the location of your existing RG
  resource_group_name = "kml_rg_main-69aeb635f1804be9" # Replace with your RG name
  dns_prefix          = "aksmincluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }
}
