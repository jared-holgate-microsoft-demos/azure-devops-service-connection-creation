# Azure DevOps Service Connection Creation using Terraform and PowerShell

This is a simple example of how to create an Azure DevOps Service Connection using Terraform and PowerShell at the Management Group Scope. This example uses a Service Principal secret which is only recommended for edge cases, such as subscription vending at the root of an ALZ deployment. We recommmend using Workload identity federation for all other cases.

## Example Usage

```pwsh
./create-service-connection.ps1  `
  -azureDevOpsPAT "************************" `
  -azureDevOpsOrg "my-org" `
  -azureDevOpsProject "my-project" `
  -azureDevOpsServiceConnectionName "my-service-connection" `
  -azureDevOpsServiceConnectionDescription "my-service-connection-description" `
  -servicePrincipalName "my-service-principal" `
  -tenantId "825a3a13-cf8a-4d81-8946-d7b1aadfd24f" `
  -managementGroupId "my-management-group"
```
