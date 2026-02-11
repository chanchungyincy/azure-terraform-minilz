module "rg" {
  source   = "../../modules/resource_group"
  name     = "${var.name_prefix}-rg"
  location = var.location
  tags     = var.tags
}

module "hub_network" {
  source              = "../../modules/network_hub"
  resource_group_name = module.rg.name
  location            = var.location
  name_prefix         = "${var.name_prefix}-hub"
  tags                = var.tags
}

module "spoke_network" {
  source              = "../../modules/network_spoke"
  resource_group_name = module.rg.name
  location            = var.location
  name_prefix         = "${var.name_prefix}-spoke"
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

module "logging" {
  source              = "../../modules/logging"
  resource_group_name = module.rg.name
  location            = var.location
  name_prefix         = "${var.name_prefix}-hub"
  tags                = var.tags

  action_group_email = var.budget_email
}

module "vm_mgmt" {
  source              = "../../modules/compute_linux_vm"
  resource_group_name = module.rg.name
  location            = var.location
  name_prefix         = "${var.name_prefix}-vm-mgmt"

  subnet_id        = module.spoke_network.subnet_mgmt_id
  admin_username   = var.admin_username
  ssh_public_key   = var.ssh_public_key
  create_public_ip = true

  tags = var.tags
  
  vm_size = var.vm_size
}

