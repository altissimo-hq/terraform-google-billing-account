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

variable "billing_project_id" {
  description = "Project ID for the project that will be used to call the Cloud Billing API."
  type        = string
}

variable "iam_policy" {
  description = "IAM policy to apply to the billing account"
  type        = map(list(string))
  default     = {}
}
