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
