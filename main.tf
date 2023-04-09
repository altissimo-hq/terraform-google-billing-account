terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.42.0"
    }
    external = {
      source  = "hashicorp/external"
      version = ">= 2.2.0"
    }
  }
}

provider "google" {
  billing_project       = var.billing_project_id
  project               = var.billing_project_id
  user_project_override = true
}

variable "billing_project_id" {
  description = "Project ID for the project that will be used to call the Cloud Billing API."
  type        = string
}
