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
