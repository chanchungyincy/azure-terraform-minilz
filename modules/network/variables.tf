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
  description = "Prefix for network resources."
}

variable "tags" {
  type        = map(string)
  description = "Common tags."
  default     = {}
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR range allowed to SSH into mgmt subnet (e.g. your home IP/32)."
}

