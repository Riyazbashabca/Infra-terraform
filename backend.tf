terraform {

  backend "azurerm" {

    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatefilefordemo"
    container_name       = "tfstate"
    key                  = "demo.terraform.tfstate"

  }
}