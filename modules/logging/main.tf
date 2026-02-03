resource "azurerm_log_analytics_workspace" "this" {
  name                = "${var.name_prefix}-law"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}

resource "azurerm_monitor_action_group" "email" {
  name                = "${var.name_prefix}-ag-email"
  resource_group_name = var.resource_group_name
  short_name          = "emailag"

  email_receiver {
    name                    = "owner-email"
    email_address           = var.action_group_email
    use_common_alert_schema = true
  }

  tags = var.tags
}
