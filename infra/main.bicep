targetScope = 'subscription'
param prefix string = 'azd'

@minLength(1)
@maxLength(64)
@description('Name of the environment that can be used as part of naming resource convention')
param environmentName string

@minLength(1)
@description('Primary location for all resources')
param location string

param deployBaselineWebappExists bool

@description('Id of the user or app to assign application roles')
param principalId string

var tags = {
  'azd-env-name': environmentName
}
@description('The admin user name for the Azure SQL instance.')
param adminUserName string

@description('The admin password for the Azure SQL instance.')
@secure()
param adminPassword string
param emailAddress string

@description('Deployment settings for the Log Analytics workspace.')
param logAnalytics object = {
  name: 'la-${uniqueString(subscription().subscriptionId)}-${prefix}'
  skuName: 'PerGB2018'
}

@description('Deployment settings for Azure SQL and Azure SQL database instances.')
param azureSqlDatabase object = {
  serverName: 'sql-${uniqueString(subscription().subscriptionId)}-${prefix}'
  databaseName: 'appdb'
  collation: 'SQL_Latin1_General_CP1_CI_AS'
  edition: 'Standard'
  maxSizeBytes: '1073741824'
  requestedServiceObjectiveName: 'S0'
}

@description('Deployment settings for Azure Key Vault instances.')
param keyVault object = {
  name: 'kv-${uniqueString(subscription().subscriptionId)}-${prefix}'
  skuName: 'standard'
  skuFamily: 'A'
}

@description('Deployment settings for Azure App Service instance.')
param azureAppService object = {
  name: 'app-${uniqueString(subscription().subscriptionId)}-${prefix}'
  webSiteName: 'app-${uniqueString(subscription().subscriptionId)}-${prefix}'
  skuName: 'S1'
  skuCapacity: 1
  autoScaleCpuMax: '80'
  autoScaleCpuMin: '60'
  autoScaleMin: 1
  autoscaleMax: 2
  autoscaleDefault: 1
}
param deploySlots bool = true

// Organize resources in a resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module resources 'resources.bicep' = {
  scope: rg
  name: 'resources'
  params: {
    location: location
    adminPassword: adminPassword
    adminUserName: adminUserName
    emailAddress: emailAddress
  }
}

