module "rg" {
  source   = "../../modules/resource_group"
  name     = "${var.name_prefix}-rg"
  location = var.location
  tags     = var.tags
}