targetScope = 'subscription'

// @description('Array of actions for the roleDefinition')
// param actions array = [
//   'Microsoft.Authorization/*/read'
//   'Microsoft.Resources/subscriptions/operationresults/read'
//   'Microsoft.Resources/subscriptions/read'
//   'Microsoft.Resources/subscriptions/resourceGroups/read'
//   'Microsoft.ContainerService/managedClusters/listClusterUserCredential/action'
// ]

// @description('Array of notActions for the roleDefinition')
// param notActions array = []

// param dataActions array = [
//   'Microsoft.ContainerService/managedClusters/*'
// ]

// @description('Friendly name of the role definition')
// param roleName string = 'Custom Cluster Admin'

// @description('Detailed description of the role definition')
// param roleDescription string = 'Subscription Level Custom Cluster Admin Role'

module roleCreationModule './create-role.bicep' = {
  name: 'roleDeploy'
  params: {
    roleName: 'Custom Cluster Admin'
    roleDescription: 'Subscription Level Custom Cluster Admin Role'
    actions: [
      'Microsoft.Authorization/*/read'
      'Microsoft.Resources/subscriptions/operationresults/read'
      'Microsoft.Resources/subscriptions/read'
      'Microsoft.Resources/subscriptions/resourceGroups/read'
      'Microsoft.ContainerService/managedClusters/listClusterUserCredential/action'
    ]
    notActions: []
    dataActions: [
      'Microsoft.ContainerService/managedClusters/*'
    ]
    notDataActions: []
  }
}
output roleDefinitionId string = roleCreationModule.outputs.roleDefinitionId

// az deployment group create --resource-group roles-rg --template-file 
// az group create --name roles-rg --location eastus

// az deployment sub create --location eastus --template-file resources/bicep-templates/roles/read-and-delete-role.bicep
