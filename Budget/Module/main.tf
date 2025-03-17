provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "budget_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_monitor_action_group" "budget_action_group" {
  name                = var.action_group_name
  resource_group_name = azurerm_resource_group.budget_rg.name
  short_name          = var.action_group_short_name
}

resource "azurerm_consumption_budget_resource_group" "budget" {
  name              = var.budget_name
  resource_group_id = azurerm_resource_group.budget_rg.id

  amount     = var.budget_amount
  time_grain = var.time_grain

  time_period {
    start_date = var.start_date
    end_date   = var.end_date
  }

  filter {
    dimension {
      name   = "ResourceId"
      values = [azurerm_monitor_action_group.budget_action_group.id]
    }

    tag {
      name   = var.tag_name
      values = var.tag_values
    }
  }

  dynamic "notification" {
    for_each = var.notifications
    content {
      enabled        = notification.value["enabled"]
      threshold      = notification.value["threshold"]
      operator       = notification.value["operator"]
      threshold_type = lookup(notification.value, "threshold_type", null)

      contact_emails = lookup(notification.value, "contact_emails", [])
      contact_groups = lookup(notification.value, "contact_groups", [])
      contact_roles  = lookup(notification.value, "contact_roles", [])
    }
  }
}
