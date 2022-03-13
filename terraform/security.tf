# Security group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group

resource "azurerm_network_security_group" "sshtraffic" {
    name                = "sshtraffic_${var.vms[count.index]}"
    count               = length(var.vms)
    location            = azurerm_resource_group.rgCP2_gsoto.location
    resource_group_name = azurerm_resource_group.rgCP2_gsoto.name

    security_rule {
        name                       = "SSH"
        priority                   = "${count.index + 1000}"
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "CP2"
    }
}

# Vinculamos el security group al interface de red
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association

resource "azurerm_network_interface_security_group_association" "gsSecGroupAssociation1" {
    network_interface_id      = azurerm_network_interface.nicCP2_gsoto[count.index].id
    count                     = length(var.vms)
    network_security_group_id = azurerm_network_security_group.sshtraffic[count.index].id
}