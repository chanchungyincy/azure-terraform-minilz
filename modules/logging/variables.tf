variable "resource_group_name" {
  type        = string
  description = "RG for logging resources."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "name_prefix" {
  type        = string
  description = "Prefix for logging resources."
}

variable "tags" {
  type        = map(string)
  description = "Common tags."
  default     = {}
}

variable "action_group_email" {
  type        = string
  description = "Email for alert notifications."
}
