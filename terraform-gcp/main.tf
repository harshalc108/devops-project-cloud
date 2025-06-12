terraform {
  backend "gcs" {
    bucket = "terraform-state-file-dev-325d9b70"
    prefix = "terraform/state"
  }
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

module "service_account" {
  source        = "./modules/service_account"
  account_id    = "terraform-deployer"
  display_name  = "Terraform Deployer SA"
}

module "vm_instance" {
  source         = "./modules/compute_instance"
  instance_name  = "terraform-test-vm"
  zone           = var.zone
  tags           = ["terraform", "dev"]
}

