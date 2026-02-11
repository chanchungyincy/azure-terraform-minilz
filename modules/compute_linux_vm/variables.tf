variable "resource_group_name" {
  type        = string
  description = "Target resource group name."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "name_prefix" {
  type        = string
  description = "Prefix for VM-related resources."
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the VM NIC (e.g. spoke mgmt subnet)."
}

variable "admin_username" {
  type        = string
  description = "Admin username for SSH."
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key."
}

variable "create_public_ip" {
  type        = bool
  description = "Whether to create a public IP."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Common tags."
  default     = {}
}

variable "vm_size" {
  type        = string
  description = "Size of the Linux VM."
  default     = "Standard_B1s"
}