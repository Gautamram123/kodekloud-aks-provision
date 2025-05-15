variable "subscription_id" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "dns_prefix" { type = string }
variable "node_count" { type = number }
variable "vm_size" { type = string }

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  use_cli         = false
  use_msi         = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-minimal-cluster"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }
}
