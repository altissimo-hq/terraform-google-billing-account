# Altissimo - Google Billing Account (Terraform Module)

The repo contains a terraform module for managing an existing Google Cloud Platform (GCP) billing account.

In addition to creating the project, this module will enable project services, create service accounts, and manage the project IAM policy.

`altissimo-hq/terraform-google-billing-account`

---

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_external"></a> [external](#requirement\_external) | >= 2.2.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.42.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | 2.3.1 |
| <a name="provider_google"></a> [google](#provider\_google) | 4.60.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_budget"></a> [budget](#module\_budget) | terraform-google-modules/project-factory/google//modules/budget | n/a |

## Resources

| Name | Type |
|------|------|
| [google_billing_account_iam_policy.billing_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_account_iam_policy) | resource |
| [external_external.gcloud-billing-budgets-list](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [google_billing_account.account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/billing_account) | data source |
| [google_iam_policy.billing_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account_id"></a> [billing\_account\_id](#input\_billing\_account\_id) | Google Billing Account ID (one of billing\_account\_id or billing\_account\_name must be specified) | `string` | `null` | no |
| <a name="input_billing_account_name"></a> [billing\_account\_name](#input\_billing\_account\_name) | Google Billing Account Display Name (one of billing\_account\_id or billing\_account\_name must be specified) | `string` | `null` | no |
| <a name="input_billing_project_id"></a> [billing\_project\_id](#input\_billing\_project\_id) | Project ID for the project that will be used to call the Cloud Billing API. | `string` | n/a | yes |
| <a name="input_budgets"></a> [budgets](#input\_budgets) | Map of Budgets to create | <pre>map(object({<br>    alert_pubsub_topic               = optional(string),<br>    alert_spend_basis                = optional(string),<br>    alert_spent_percents             = optional(list(number)),<br>    amount                           = number<br>    calendar_period                  = optional(string)<br>    credit_types_treatment           = optional(string)<br>    custom_period_end_date           = optional(string)<br>    custom_period_start_date         = optional(string)<br>    labels                           = optional(map(string))<br>    monitoring_notification_channels = optional(list(string))<br>    projects                         = optional(list(string))<br>    services                         = optional(list(string))<br>  }))</pre> | `{}` | no |
| <a name="input_gcloud_command"></a> [gcloud\_command](#input\_gcloud\_command) | Path to the gcloud cli. Set to the path to the gcloud cli (this will be "gcloud"<br>for most users, or "/path/to/gcloud" if you have installed it in a non-standard<br>location). Defaults to null, which disables the gcloud query as well as the<br>ability to output a list of unmanaged budgets. | `string` | `null` | no |
| <a name="input_iam_policy"></a> [iam\_policy](#input\_iam\_policy) | IAM policy to apply to the billing account | `map(list(string))` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_billing_account_id"></a> [billing\_account\_id](#output\_billing\_account\_id) | Google Billing Account ID (string) |
| <a name="output_billing_account_name"></a> [billing\_account\_name](#output\_billing\_account\_name) | Google Billing Account Display Name (string) |
| <a name="output_billing_account_status"></a> [billing\_account\_status](#output\_billing\_account\_status) | Google Billing Account Status (string) |
| <a name="output_budget_names"></a> [budget\_names](#output\_budget\_names) | List of Billing Account Budget Names (list) |
<!-- END_TF_DOCS -->
