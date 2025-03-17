resource_group_name     = "today-rg"
location                = "central india"
action_group_name       = "testaction7500"
action_group_short_name = "action7598"
budget_name             = "training-budget100"
budget_amount           = 1000
time_grain              = "Monthly"
start_date              = "2025-03-01T00:00:00Z"
end_date                = "2025-04-01T00:00:00Z"
tag_name                = "budget-for-training"
tag_values              = ["school", "college"]

notifications = [
  {
    enabled        = true
    threshold      = 90.0
    operator       = "EqualTo"
    threshold_type = "Forecasted"
    contact_emails = ["foo@example.com", "bar@example.com"]
    contact_groups = []
    contact_roles  = ["Owner"]
  },
  {
    enabled        = false
    threshold      = 100.0
    operator       = "GreaterThan"
    contact_emails = ["foo@example.com", "bar@example.com"]
    contact_groups = []
    contact_roles  = []
  }
]
