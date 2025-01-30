targetScope = 'subscription'

// @description('PrincipalId of the user')
// param principalId string = '9584b054-9b2e-46bf-8333-35bd4af4272e'

// @description('Role Definition Id of the role to be assigned')
// param roleDefinitionId string = '15979814-a462-5f8a-86b7-c62d702ebdee'

module roleAssignmentModule './create-role-assignment.bicep' = {
  name: 'roleDeploy'
  params: {
    userPrincipalId: '9584b054-9b2e-46bf-8333-35bd4af4272e'
    roleDefinitionId: '15979814-a462-5f8a-86b7-c62d702ebdee'
  }
}

output roleAssignmentId string = roleAssignmentModule.outputs.principalId

//  az deployment sub create --location eastus --template-file read-and-delete-role-assignment.bicep
//  az ad user show --id temp@madhurgupta004gmail.onmicrosoft.com --query id

// az role definition list --name "MyCustomRole" --query "[].name" --output tsv
