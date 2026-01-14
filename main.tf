terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rohit-tfstate-rg"
    storage_account_name = "rohittfstatestorage123"
    container_name       = "rohit-terraform-state"
    key                  = "rohit-jenkins.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rohit-jenkins-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "rohit-jenkins-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
