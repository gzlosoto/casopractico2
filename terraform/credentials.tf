# crea un service principal y rellena los siguientes datos para autenticar
provider "azurerm" {
    features {}
    subscription_id = "c8bff71a-9dd7-469a-afe5-9c997ea88666"
    client_id = "68fbd4f2-1fb3-4221-be71-84c266b33c31" # appID
    client_secret = "uBmXx1F16k1B6DjT-f1iD8Bf167m7tgmPT" # password
    tenant_id = "899789dc-202f-44b4-8472-a6d40f9eb440" # tenant
}