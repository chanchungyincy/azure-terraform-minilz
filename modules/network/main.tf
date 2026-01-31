resource "azurerm_virtual_network" "this" {
  name                = "${var.name_prefix}-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.10.0.0/16"]
  tags                = var.tags
}

resource "azurerm_subnet" "mgmt" {
  name                 = "${var.name_prefix}-snet-mgmt"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_subnet" "app" {
  name                 = "${var.name_prefix}-snet-app"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.10.2.0/24"]
}

resource "azurerm_network_security_group" "mgmt" {
  name                = "${var.name_prefix}-nsg-mgmt"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_group" "app" {
  name                = "${var.name_prefix}-nsg-app"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_rule" "mgmt_ssh" {
  name                        = "Allow-SSH-From-Home"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.allowed_ssh_cidr
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.mgmt.name
}

resource "azurerm_subnet_network_security_group_association" "mgmt" {
  subnet_id                 = azurerm_subnet.mgmt.id
  network_security_group_id = azurerm_network_security_group.mgmt.id
}

resource "azurerm_subnet_network_security_group_association" "app" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app.id
}
