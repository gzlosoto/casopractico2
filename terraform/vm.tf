# Creamos una máquina virtual
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "gsVM1" {
    name                = "gsVM-${var.vms[count.index]}"
    count               = length(var.vms)
    resource_group_name = azurerm_resource_group.rgCP2_gsoto.name
    location            = azurerm_resource_group.rgCP2_gsoto.location
    size                = var.vm_size
    admin_username      = var.ssh_user #"adminUsername"
    network_interface_ids = [ azurerm_network_interface.nicCP2_gsoto[count.index].id ]
    disable_password_authentication = true    

    admin_ssh_key {
        username   = var.ssh_user#"adminUsername"
        public_key = file(var.public_key_path)#tls_private_key.linux_key.public_key_openssh
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.gsotoaccount007.primary_blob_endpoint
    }

    tags = {
        environment = "CP2"
    }

}