variable "project_name" {
  type        = string
  description = "Azure DevOps Project Name"
}

variable "service_connection_name" {
  type        = string
  description = "Azure DevOps Service Connection Name"
}

variable "service_connection_description" {
  type        = string
  description = "Azure DevOps Service Connection Description"
}

variable "service_principal_name" {
  type        = string
  description = "Azure Service Principal Name"
}

variable "management_group_id" {
  type        = string
  description = "Azure Management Group ID"
}

variable "secret_expiration_in_hours" {
  type        = number
  description = "Azure Service Principal Secret Expiration in Hours"
  default     = 26280
}

variable "approval_group_name" {
  type        = string
  description = "Azure DevOps Approval Group Name"
}
