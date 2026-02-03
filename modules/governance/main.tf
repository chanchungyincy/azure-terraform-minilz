resource "azurerm_consumption_budget_resource_group" "rg" {
  count            = var.enable_budget ? 1 : 0
  name             = "${var.name_prefix}-rg-budget"
  resource_group_id = var.resource_group_id

  amount     = var.budget_amount_usd
  time_grain = "Monthly"

  time_period {
    start_date = "${var.budget_start_date}T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = 30
    operator       = "GreaterThan"
    threshold_type = "Actual"
    contact_emails = [var.budget_email]
  }
}
