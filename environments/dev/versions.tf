terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "minilz1-rg"
    storage_account_name = "ccyinminilz1"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}