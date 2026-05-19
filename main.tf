
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id  = "402b176d-5957-40fe-9b7c-b75ce482b0fe"
  client_id        = "03c431f4-72e6-489c-8855-ea12afa4ead5"
  client_secret    = "6iF8Q~yDgX7ahRn8VFp6enBe.4sUJgQ4C34GtcYw"
  tenant_id        = "20ade2b2-2ce5-4299-8e61-44025f44b78b"
}
resource "azurerm_resource_group" "vnet-demo" {
    name     = "dev-demo-vnet-rg"
    location = "East US"
  
}
resource "azurerm_resource_group" "iam-demo" {
    name     = "dev-demo-iam-rg"
    location = "East US"
  
}