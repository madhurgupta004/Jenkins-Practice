targetScope = 'subscription'

@description('PrincipalId of the user')
param userPrincipalId string

@description('Role Definition Id of the role to be assigned')
param roleDefinitionId string

var roleAssignmentName = guid(subscription().id, userPrincipalId, roleDefinitionId)

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-08-01-preview' = {
  name: roleAssignmentName
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
    principalId: userPrincipalId
  }
}

output principalId string = roleAssignment.name
