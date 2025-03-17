output "resource_group_id" {
  value = azurerm_resource_group.budget_rg.id
}

output "action_group_id" {
  value = azurerm_monitor_action_group.budget_action_group.id
}

output "budget_id" {
  value = azurerm_consumption_budget_resource_group.budget.id
}
