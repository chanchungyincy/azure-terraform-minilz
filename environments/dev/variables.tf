variable "location" {
  type        = string
  description = "Azure region."
}

variable "name_prefix" {
  type        = string
  description = "Prefix for resource naming (unique per repo)."
}

variable "tags" {
  type        = map(string)
  description = "Common tags for all resources."
  default     = {}
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR allowed to SSH into mgmt subnet."
}

variable "enable_budget" {
  type        = bool
  description = "Whether to create an RG-scoped budget."
  default     = true
}

variable "budget_amount_usd" {
  type        = number
  description = "Monthly budget in USD."
}

variable "budget_start_date" {
  type        = string
  description = "Budget start date in YYYY-MM-DD."
}

variable "budget_email" {
  type        = string
  description = "Alert email for budget notifications."
}

variable "admin_username" {
  type        = string
  description = "Admin username for SSH."
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for the VM."
}

variable "vm_size" {
  type        = string
  description = "Size of the Linux VM."
  default     = "Standard_B1s"
}
