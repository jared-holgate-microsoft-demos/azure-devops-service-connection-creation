terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "~> 0.11"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.47"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.93"
    }
  }
}

provider "azuredevops" {}

provider "azuread" {}

provider "azurerm" {
    features {}
}
