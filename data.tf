data "azuredevops_project" "this" {
  name = var.project_name
}

data "azuread_application" "this" {
  display_name = var.service_principal_name
}

data "azurerm_management_group" "this" {
  name = var.management_group_id
}

data "azuread_client_config" "current" {}
