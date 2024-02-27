param(
    [Parameter(Mandatory=$true, HelpMessage="Azure DevOps Personal Access Token")]
    [string]$azureDevOpsPAT,
    [Parameter(Mandatory=$true, HelpMessage="Azure DevOps Organization Name")]
    [string]$azureDevOpsOrg,
    [Parameter(Mandatory=$true, HelpMessage="Azure DevOps Project Name")]
    [string]$azureDevOpsProject,
    [Parameter(Mandatory=$true, HelpMessage="Azure DevOps Service Connection Name")]
    [string]$azureDevOpsServiceConnectionName,
    [Parameter(Mandatory=$true, HelpMessage="Azure DevOps Service Connection Description")]
    [string]$azureDevOpsServiceConnectionDescription,
    [Parameter(Mandatory=$true, HelpMessage="Azure Subscription ID")]
    [string]$servicePrincipalName,
    [Parameter(Mandatory=$true, HelpMessage="Azure Tenant ID")]
    [string]$tenantId,
    [Parameter(Mandatory=$true, HelpMessage="Azure Management Group ID")]
    [string]$managementGroupId,
    [Parameter(Mandatory=$false, HelpMessage="Azure DevOps Personal Access Token")]
    [int]$servicePrincipalSecretExpiryInHours = 26280,
    [Parameter(Mandatory=$false, HelpMessage="Azure DevOps Approval Group Name")]
    [string]$approvalGroupName
)

$env:AZDO_ORG_SERVICE_URL = "https://dev.azure.com/$azureDevOpsOrg"
$env:AZDO_PERSONAL_ACCESS_TOKEN = $azureDevOpsPAT

az login --tenant "$tenantId"

terraform init

terraform apply `
    -var "project_name=$azureDevOpsProject" `
    -var "service_connection_name=$azureDevOpsServiceConnectionName" `
    -var "service_connection_description=$azureDevOpsServiceConnectionDescription" `
    -var "service_principal_name=$servicePrincipalName" `
    -var "management_group_id=$managementGroupId" `
    -var "secret_expiration_in_hours=$servicePrincipalSecretExpiryInHours" `
    -var "approval_group_name=$approvalGroupName"
