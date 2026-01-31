variable "name" {
  type        = string
  description = "Resource group name."
}

variable "location" {
  type        = string
  description = "Azure region (e.g., eastasia)."
}

variable "tags" {
  type        = map(string)
  description = "Common tags applied to all resources."
  default     = {}
}
