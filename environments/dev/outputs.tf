output "resource_group_name" {
  value = module.rg.name
}

output "resource_group_id" {
  value = module.rg.id
}

output "vm_name" {
  value = module.vm_mgmt.vm_name
}

output "vm_public_ip" {
  value = module.vm_mgmt.public_ip_address
}