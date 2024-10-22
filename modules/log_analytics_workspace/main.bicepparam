using '../log_analytics_workspace/main.bicep'

param name = 'ps-dw-dv-log'
param location = 'eastus' 
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
param useResourcePermissions = false
param forceCmkForQuery = true
param enableTelemetry = true

