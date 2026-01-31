output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "subnet_mgmt_id" {
  value = azurerm_subnet.mgmt.id
}

output "subnet_app_id" {
  value = azurerm_subnet.app.id
}
