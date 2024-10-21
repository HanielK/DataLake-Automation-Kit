
#Note: use "what If" to test dry run and deployment of resource provider are registered.
#FThe following is the deployment sequence:
#Deploy log analytics workspace
#Deploy Nat Gateway
#Deploy Virtual Network
#Deploy Data Storage Account
#Deploy Meta Storage Account
#Deploy Key Vault
#Deploy Databricks Workspace
#Deploy DataBricks Access Connector

az login

$env = "sb"
$rg = "ps-dw-sb-rg"
$sb = "144af092-409d-455c-b4c2-12a728f76ff5"

az account set --subscription $sb
az account show --output table

az deployment group create `
    --resource-group $rg `
    --template-file "./common-config/log_analytics_workspace.bicep" `
    --parameters "./environments/${env}/_parameters.${env}.json" `
    --parameters "./environments/${env}/_parameters.log_analytics_workspace.json" `
    --mode Incremental `
    --what-if


    # --template-file "./common-config/nat_gateway.bicep" `
    # --parameters "./environments/${env}/_parameters.${env}.json" `
    # --parameters "./environments/${env}/_parameters.nat_gateway.json" `
    # --template-file "./common-config/virtual_network.bicep" `
    # --parameters "./environments/${env}/_parameters.${env}.json" `
    # --parameters "./environments/${env}/_parameters.virtual_network.json" `
    # --template-file "./common-config/storage_account_data.bicep" `
    # --parameters "./environments/${env}/_parameters.${env}.json" `
    # --parameters "./environments/${env}/_parameters.storage_account_data.json" `
    # --template-file "./common-config/storage_account_metastore.bicep" `
    # --parameters "./environments/${env}/_parameters.${env}.json" `
    # --parameters "./environments/${env}/_parameters.storage_account_metastore.json" `
    # --template-file "./common-config/lkey_vault.bicep" `
    # --parameters "./environments/${env}/_parameters.${env}.json" `
    # --parameters "./environments/${env}/_parameters.key_vault.json" `
    # --template-file "./common-config/databricks_workspace.bicep" `
    # --parameters "./environments/${env}/_parameters.${env}.json" `
    # --parameters "./environments/${env}/_parameters.databricks_workspace.json" `
    # --template-file "./common-config/databricks_access_connector.bicep" `
    # --parameters "./environments/${env}/_parameters.${env}.json" `
    # --parameters "./environments/${env}/_parameters.databricks_access_connector.json" `
    # --name "HanielW-TestDeployment" `
    # --mode Incremental `
    # --what-if