targetScope = 'subscription'

@description('Array of actions for the roleDefinition')
param actions array

@description('Array of notActions for the roleDefinition')
param notActions array

@description('Array of dataActions for the roleDefinition')
param dataActions array

@description('Array of notDataActions for the roleDefinition')
param notDataActions array

@description('Friendly name of the role definition')
param roleName string

@description('Detailed description of the role definition')
param roleDescription string

var roleDefName = guid(roleName)

resource roleDef 'Microsoft.Authorization/roleDefinitions@2022-04-01' = {
  name: roleDefName
  properties: {
    roleName: roleName
    description: roleDescription
    type: 'customRole'
    permissions: [
      {
        actions: actions
        notActions: notActions
        dataActions: dataActions
        notDataActions: notDataActions
      }
    ]
    assignableScopes: [
      subscription().id
    ]
  }
}

output roleDefinitionId string = roleDef.id
output roleDefName string = roleDefName
