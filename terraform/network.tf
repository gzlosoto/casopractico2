# Creación de red
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network

resource "azurerm_virtual_network" "netCP2_gsoto" {
    name                = "netCP2_gsoto"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.rgCP2_gsoto.location
    resource_group_name = azurerm_resource_group.rgCP2_gsoto.name

    tags = {
        environment = "CP2"
    }
}

# Creación de subnet
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet

resource "azurerm_subnet" "subNetCP2_gsoto" {
    name                   = "subNetCP2_gsoto"
    resource_group_name    = azurerm_resource_group.rgCP2_gsoto.name
    virtual_network_name   = azurerm_virtual_network.netCP2_gsoto.name
    address_prefixes       = ["10.0.1.0/24"]

}

# Create NIC
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface

resource "azurerm_network_interface" "nicCP2_gsoto" {
  name                = "nicCP2_gsoto_${var.vms[count.index]}"
  count               = length(var.vms)
  location            = azurerm_resource_group.rgCP2_gsoto.location
  resource_group_name = azurerm_resource_group.rgCP2_gsoto.name

    ip_configuration {
    name                           = "gsipconfiguration1_${var.vms[count.index]}"
    subnet_id                      = azurerm_subnet.subNetCP2_gsoto.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.${count.index + 10}"
    public_ip_address_id           = azurerm_public_ip.vmip[count.index].id
  }

    tags = {
        environment = "CP2"
    }

}

# IP pública
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip

resource "azurerm_public_ip" "vmip" {
  name                = "vmip_${var.vms[count.index]}"
  count               = length(var.vms)
  location            = azurerm_resource_group.rgCP2_gsoto.location
  resource_group_name = azurerm_resource_group.rgCP2_gsoto.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "CP2"
    }

}