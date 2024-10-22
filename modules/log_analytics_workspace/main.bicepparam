using './main.bicep'

param name = ''
param location = resourceGroup().location
param skuName = 'PerGB2018'
param skuCapacityReservationLevel = 100
param storageInsightsConfigs = []
param linkedServices = []
param linkedStorageAccounts = []
param savedSearches = []
param dataExports = []
param dataSources = []
param tables = []
param gallerySolutions = []
param dataRetention = 365
param dailyQuotaGb = -1
param publicNetworkAccessForIngestion = 'Enabled'
param publicNetworkAccessForQuery = 'Enabled'
param managedIdentities = ''
param useResourcePermissions = false
param diagnosticSettings = ''
param forceCmkForQuery = true
param lock = ''
param roleAssignments = ''
param tags =

param enableTelemetry = true

