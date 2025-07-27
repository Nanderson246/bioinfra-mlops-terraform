provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "ml_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "ml_vnet" {
  name                = "ml-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.ml_rg.location
  resource_group_name = azurerm_resource_group.ml_rg.name
}

resource "azurerm_subnet" "ml_subnet" {
  name                 = "ml-subnet"
  resource_group_name  = azurerm_resource_group.ml_rg.name
  virtual_network_name = azurerm_virtual_network.ml_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "ml_nic" {
  name                = "ml-nic"
  location            = azurerm_resource_group.ml_rg.location
  resource_group_name = azurerm_resource_group.ml_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.ml_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "ml_vm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.ml_rg.name
  location            = azurerm_resource_group.ml_rg.location
  size                = var.vm_size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.ml_nic.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

