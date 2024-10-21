az login

$env = "sb"
$rg = "ps-dw-sb-rg"
$sb = "4280aaac-7665-42a5-9a8c-5af0590c5c52"

az account set --subscription $sb
az account show --output table

az deployment group create `
    --resource-group $rg `
    --template-file "./common-config/storage_account_metastore.bicep" `
    --parameters "./environments/${env}/_parameters.${env}.json" `
    --parameters "./environments/${env}/_parameters.storage_account_metastore.json" `
    --name "ps-dw-dv-metastr" `
    --mode Incremental `
    --what-if


# **************************************************************************
#  Notes... deploy resources accodrding to the following sequence
# **************************************************************************
# =-> Deploy Log Analytics Workspace
# =-> Deploy Nat Gateway
# =-> Deploy Virtual Network
# =-> Deploy Data Storage Account
# =-> Deploy Meta Storage Account
# =-> Deploy Key Vault
# =-> Deploy Event Hub Namepsace
# =-> Deploy Data Factory
# =-> Deploy Databricks Workspace
# =-> Deploy DataBricks Access Connector
# ---------------------------------------------------------------------------