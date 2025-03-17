module "azure_budget" {
  source                  = "../azure_budget_alert"
  resource_group_name     = var.resource_group_name
  location                = var.location
  action_group_name       = var.action_group_name
  action_group_short_name = var.action_group_short_name
  budget_name             = var.budget_name
  budget_amount           = var.budget_amount
  time_grain              = var.time_grain
  start_date              = var.start_date
  end_date                = var.end_date
  tag_name                = var.tag_name
  tag_values              = var.tag_values
  notifications           = var.notifications
}
