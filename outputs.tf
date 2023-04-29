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

