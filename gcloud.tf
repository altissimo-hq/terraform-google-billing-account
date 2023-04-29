variable "gcloud_command" {
  description = <<-EOT
    Path to the gcloud cli. Set to the path to the gcloud cli (this will be "gcloud"
    for most users, or "/path/to/gcloud" if you have installed it in a non-standard
    location). Defaults to null, which disables the gcloud query as well as the
    ability to output a list of unmanaged budgets.
  EOT
  type        = string
  default     = null
}

# Retrieve a list of billing account budgets
data "external" "gcloud_billing_budgets_list" {
  count = var.gcloud_command == null ? 0 : 1
  program = [
    "bash",
    "${path.module}/scripts/gcloud.sh",
    var.gcloud_command,
    "--project=${var.billing_project_id}",
    "billing",
    "budgets",
    "list",
    "--billing-account=${local.billing_account_id}",
  ]
  lifecycle {
    precondition {
      condition     = var.billing_project_id != null
      error_message = "Billing Project ID is required for listing Billing Account Budgets."
    }
  }
}

locals {

  # Get the Billing Account ID from the Billing Account data source
  billing_account_id = data.google_billing_account.account.id

  # Retrieve the list of Billing Account Budgets from gcloud
  gcloud_budgets = var.gcloud_command == null ? null : jsondecode(data.external.gcloud_billing_budgets_list[0].result.data)

  # Generate a list of billing accoun budget names
  gcloud_budget_names = var.gcloud_command == null ? null : [for budget in local.gcloud_budgets : budget.displayName]
}

output "budget_names" {
  description = "List of Billing Account Budget Names (list)"
  value       = local.gcloud_budget_names
}
