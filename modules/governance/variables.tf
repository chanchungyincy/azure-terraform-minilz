variable "resource_group_id" {
  type        = string
  description = "ID of the resource group to apply the budget to."
}

variable "name_prefix" {
  type        = string
  description = "Prefix used for naming budget."
}

variable "enable_budget" {
  type        = bool
  description = "Whether to create a budget for this RG."
  default     = true
}

variable "budget_amount_usd" {
  type        = number
  description = "Monthly budget amount in USD."
}

variable "budget_start_date" {
  type        = string
  description = "Budget start date in YYYY-MM-DD format."
}

variable "budget_email" {
  type        = string
  description = "Email to receive budget alerts."
}
