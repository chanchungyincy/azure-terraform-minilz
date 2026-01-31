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