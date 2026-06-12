
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id  = var.subscription_id
  client_id        = var.client_id
  client_secret    = var.client_secret
  tenant_id        = var.tenant_id
}
resource "azurerm_resource_group" "vnet-demo" {
    name     = "dev-demo-vnet-rg"
    location = "East US"
    tags = {
        environment = "dev"
    }
  
}
resource "azurerm_resource_group" "iam-demo" {
    name     = "dev-demo-iam-rg"
    location = "East US"
    tags = {
        environment = "dev"
    }
}