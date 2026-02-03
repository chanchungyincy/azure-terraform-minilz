module "rg" {
  source   = "../../modules/resource_group"
  name     = "${var.name_prefix}-rg"
  location = var.location
  tags     = var.tags
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = module.rg.name
  location            = var.location
  name_prefix         = var.name_prefix
  tags                = var.tags

  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "governance" {
  source            = "../../modules/governance"
  resource_group_id = module.rg.id
  name_prefix       = var.name_prefix

  enable_budget     = var.enable_budget
  budget_amount_usd = var.budget_amount_usd
  budget_start_date = var.budget_start_date
  budget_email      = var.budget_email
}
