terraform {
  backend "gcs" {
    bucket = "terraform-state-file-prod-301cb9d4"
    prefix = "terraform/state"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# terraform {
#   backend "local" {
#     path = "terraform.tfstate"
#   }
# }


resource "google_storage_bucket" "terraform_state" {
  name     = "terraform-state-file-prod-${random_id.bucket_suffix.hex}"
  location = "US"
  force_destroy = true

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}
