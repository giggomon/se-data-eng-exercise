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

# Resource: Google Cloud Storage bucket
resource "google_storage_bucket" "landing_bucket" {
  name          = var.bucket_name
  location      = var.bucket_location
  storage_class = var.storage_class

  uniform_bucket_level_access = var.uniform_bucket_level_access # Bucket policy: Make it private by default
  public_access_prevention    = var.public_access_prevention    # No public access
}

# Resource: Google Cloud Storage Object
resource "google_storage_object" "upload_sample_file" {
  name          = var.sample_file_1_name                        # The name of the file in the bucket
  bucket        = google_storage_bucket.landing_bucket.name     # Your bucket resource reference
  source        = var.sample_file_1_path                        # Path to the local file on your machine
  content_type  = "text/plain"
}