targetScope = 'subscription'

@description('PrincipalIds of the user')
param userPrincipalIds array

// param roleAssignementObjects array

@description('Role Definition Ids of the roles to be assigned')
param roleDefinitionIds array

// var roleAssignmentName = guid(subscription().id, userPrincipalId, roleDefinitionId)

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-08-01-preview' = [
  for i in range(0, length(userPrincipalIds)): {
    name: guid(subscription().id, userPrincipalIds[i], roleDefinitionIds[i])
    properties: {
      roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionIds[i])
      principalId: userPrincipalIds[i]
    }
  }
]

output roleAssignmentIds array = [for i in range(0, length(userPrincipalIds)): roleAssignment[i].name]
