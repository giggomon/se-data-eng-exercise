# Specify Terraform version
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.15.0"
    }
  }
}

# Provider configuration
provider "google" {
  credentials = var.google_credentials != "" ? var.google_credentials : null
  project     = var.project_id
  region      = var.region
}

data "google_storage_bucket" "existing_bucket" {
  name = var.bucket_name
}

# Resource: Google Cloud Storage bucket
resource "google_storage_bucket" "landing_bucket" {
  name          = var.bucket_name
  location      = var.bucket_location
  storage_class = var.storage_class

  uniform_bucket_level_access = var.uniform_bucket_level_access # Bucket policy: Make it private by default
  public_access_prevention    = var.public_access_prevention    # No public access

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_storage_bucket_object" "upload_file" {
  bucket       = google_storage_bucket.landing_bucket.name
  name         = var.sample_file_name
  source       = "../resources/sample_file.txt"
  content_type = "text/plain"

  depends_on = [google_storage_bucket.landing_bucket.name]
}