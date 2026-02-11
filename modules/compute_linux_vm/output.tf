output "public_ip_address" {
  value       = var.create_public_ip ? azurerm_public_ip.this[0].ip_address : null
  description = "Public IP of the VM (if created)."
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.this.name
}
