variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "action_group_name" {
  type        = string
  description = "Name of the Monitor Action Group"
}

variable "action_group_short_name" {
  type        = string
  description = "Short name for the action group"
}

variable "budget_name" {
  type        = string
  description = "Name of the budget"
}

variable "budget_amount" {
  type        = number
  description = "Budget limit amount"
}

variable "time_grain" {
  type        = string
  description = "Time grain for budget"
}

variable "start_date" {
  type        = string
  description = "Budget start date"
}

variable "end_date" {
  type        = string
  description = "Budget end date"
}

variable "tag_name" {
  type        = string
  description = "Tag name for filtering"
}

variable "tag_values" {
  type        = list(string)
  description = "Tag values for filtering"
}

variable "notifications" {
  type = list(object({
    enabled        = bool
    threshold      = number
    operator       = string
    threshold_type = optional(string)
    contact_emails = optional(list(string))
    contact_groups = optional(list(string))
    contact_roles  = optional(list(string))
  }))
  description = "List of notifications"
}
