resource "azuread_application_password" "this" {
  application_id = data.azuread_application.this.id
}

resource "azuredevops_serviceendpoint_azurerm" "this" {
  project_id                             = data.azuredevops_project.this.id
  service_endpoint_name                  = var.service_connection_name
  description                            = var.service_connection_description
  service_endpoint_authentication_scheme = "ServicePrincipal"
  credentials {
    serviceprincipalid  = data.azuread_application.this.client_id
    serviceprincipalkey = azuread_application_password.this.value
  }
  azurerm_spn_tenantid      = data.azuread_client_config.current.tenant_id
  azurerm_management_group_id   = data.azurerm_management_group.this.name
  azurerm_management_group_name = data.azurerm_management_group.this.display_name
}
