module "budget" {
  for_each        = var.budgets
  source          = "terraform-google-modules/project-factory/google//modules/budget"
  billing_account = local.billing_account_id
  display_name    = each.key
  amount          = each.value.amount

  alert_pubsub_topic               = try(each.value.alert_pubsub_topic, null)
  alert_spend_basis                = try(each.value.alert_spend_basis, "CURRENT_SPEND")
  alert_spent_percents             = each.value.alert_spent_percents == null ? [0.5, 0.7, 1] : each.value.alert_spent_percents
  calendar_period                  = try(each.value.calendar_period, null)
  credit_types_treatment           = try(each.value.credit_types_treatment, "INCLUDE_ALL_CREDITS")
  custom_period_end_date           = try(each.value.custom_period_end_date, null)
  custom_period_start_date         = try(each.value.custom_period_start_date, null)
  labels                           = each.value.labels == null ? {} : each.value.labels
  monitoring_notification_channels = each.value.monitoring_notification_channels == null ? [] : each.value.monitoring_notification_channels
  projects                         = each.value.projects == null ? [] : each.value.projects
  services                         = each.value.services == null ? [] : each.value.services
}

variable "budgets" {
  description = "Map of Budgets to create"
  type = map(object({
    alert_pubsub_topic               = optional(string),
    alert_spend_basis                = optional(string),
    alert_spent_percents             = optional(list(number)),
    amount                           = number
    calendar_period                  = optional(string)
    credit_types_treatment           = optional(string)
    custom_period_end_date           = optional(string)
    custom_period_start_date         = optional(string)
    labels                           = optional(map(string))
    monitoring_notification_channels = optional(list(string))
    projects                         = optional(list(string))
    services                         = optional(list(string))
  }))
  default = {}
}
