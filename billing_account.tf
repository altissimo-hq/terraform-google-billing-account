data "google_billing_account" "account" {
  billing_account = var.billing_account_id == null ? null : "billingAccounts/${var.billing_account_id}"
  display_name    = var.billing_account_name

  lifecycle {
    precondition {
      condition     = var.billing_account_id != null || var.billing_account_name != null
      error_message = "One of billing_account_id or billing_account_name must be specified."
    }
    precondition {
      condition     = (var.billing_account_id != null) != (var.billing_account_name != null)
      error_message = "Only one of billing_account_id or billing_account_name may be specified."
    }
  }
}

output "billing_account_id" {
  description = "Google Billing Account ID (string)"
  value       = data.google_billing_account.account.id
}

output "billing_account_name" {
  description = "Google Billing Account Display Name (string)"
  value       = data.google_billing_account.account.display_name
}

output "billing_account_status" {
  description = "Google Billing Account Status (string)"
  value       = data.google_billing_account.account.open == true ? "open" : "closed"
}

variable "billing_account_id" {
  description = "Google Billing Account ID (one of billing_account_id or billing_account_name must be specified)"
  type        = string
  default     = null
}

variable "billing_account_name" {
  description = "Google Billing Account Display Name (one of billing_account_id or billing_account_name must be specified)"
  type        = string
  default     = null
}
