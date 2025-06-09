provider "google" {
  project = "skilful-asset-462308-a0"
  region  = "us-central1"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "terraform_state" {
  name     = "terraform-state-file-dev-${random_id.bucket_suffix.hex}"
  location = "US"
  force_destroy = true

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}
