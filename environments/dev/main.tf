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
}