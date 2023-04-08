data "google_iam_policy" "billing_account" {
  dynamic "binding" {
    for_each = var.iam_policy
    content {
      role    = binding.key
      members = binding.value
    }
  }
}

resource "google_billing_account_iam_policy" "billing_account" {
  billing_account_id = local.billing_account_id
  policy_data        = data.google_iam_policy.billing_account.policy_data
}

variable "iam_policy" {
  description = "IAM policy to apply to the billing account"
  type        = map(list(string))
  default     = {}
}
