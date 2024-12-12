# Define variables to keep configuration flexible

variable "google_credentials" {
  description = "Path to the Google Cloud credentials JSON file"
  type        = string
  default     = "" # Empty by default for GitHub Action
}

variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
  default     = "ee-india-se-data"
}

variable "region" {
  description = "Default region for GCP resources"
  type        = string
  default     = "US"
}

variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
  default     = "se-data-landing-monica"
}

variable "bucket_location" {
  description = "Location for a GCS bucket"
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "The storage class of the bucket (e.g., STANDARD, NEARLINE, COLDLINE, ARCHIVE)"
  type        = string
  default     = "STANDARD"
}

variable "public_access_prevention" {
  description = "Enable public access prevention (e.g., 'enforced or 'unspecified')"
  type        = string
  default     = "enforced"
}

variable "uniform_bucket_level_access" {
  description = "Enable uniform bucket-level access (true/false)"
  type        = bool
  default     = true
}
