using 'create-role.bicep'
param roles = [
  {
    roleName: 'read-and-delete-role'
    roleDescription: 'Role to read and delete cluster resources'
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
  {
    roleName: 'read-and-edit-role'
    roleDescription: 'Role to read and edit cluster resources'
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
  {
    roleName: 'read-only-role'
    roleDescription: 'Role to read cluster resources'
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
]
