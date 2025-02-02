targetScope = 'subscription'

@description('PrincipalIds of the user')
param userPrincipalId string

// param userRoleObjects array

@description('Role Definition Ids of the roles to be assigned')
param roleDefinitionId string

// resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-08-01-preview' = [
//   for i in range(0, length(userPrincipalIds)): {
//     name: guid(subscription().id, userPrincipalIds[i], roleDefinitionIds[i])
//     properties: {
//       roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionIds[i])
//       principalId: userPrincipalIds[i]
//     }
//   }
// ]

// output roleAssignmentIds array = [for i in range(0, length(userPrincipalIds)): roleAssignment[i].name]
output role string = roleDefinitionId
output user string = userPrincipalId
