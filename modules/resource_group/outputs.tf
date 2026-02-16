output "name" {
  value = data.azurerm_resource_group.this.name
}

output "id" {
  value = data.azurerm_resource_group.this.id
}

output "location" {
  value = data.azurerm_resource_group.this.location
}
