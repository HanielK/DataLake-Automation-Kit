
//common params
param deploymentLocation string
param org string
param environment string
param project string

//keyvault params
param enablePurgeProtection bool

module namingModule '../modules/naming/main.bicep' = {
  name: 'namingModule'
  params: {
    org : org
    environment: environment
    project: project
  }
}

module keyVault '../modules/key-vault/main.bicep' = {
  name: 'keyVaultDeployment'
  params: {
    // Required parameters
    name: '${namingModule.outputs.naming_abbrevation}-kv'
    // Non-required parameters
    enablePurgeProtection: enablePurgeProtection
    location: deploymentLocation
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
      virtualNetworkRules: [
        {
          id: resourceId(resourceGroup().name, 'Microsoft.Network/virtualNetworks/subnets', '${namingModule.outputs.naming_abbrevation}-vnet', '${namingModule.outputs.naming_abbrevation}-sub-default')
          ignoreMissingVnetServiceEndpoint: false
        }
        {
          id: resourceId(resourceGroup().name, 'Microsoft.Network/virtualNetworks/subnets', '${namingModule.outputs.naming_abbrevation}-vnet', '${namingModule.outputs.naming_abbrevation}-sub-dbx-priv')
          ignoreMissingVnetServiceEndpoint: false
        }
        {
          id: resourceId(resourceGroup().name, 'Microsoft.Network/virtualNetworks/subnets', '${namingModule.outputs.naming_abbrevation}-vnet', '${namingModule.outputs.naming_abbrevation}-sub-dbx-pub')
          ignoreMissingVnetServiceEndpoint: false
        }
      ]
      ipRules: [
        {
          value: '146.126.51.51'
        }
        {
          value: '146.126.61.241'
        }
      ]
    }
    publicNetworkAccess: 'Enabled'
  }
}
