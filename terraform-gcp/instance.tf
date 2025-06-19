module "sonarqube" {
  source         = "./modules/compute_instance"
  instance_name  = "sonarqube-rh"
  replica_count  = 1
  zone           = var.zone
  tags           = ["terraform", "dev"]
  enable_persistent_disk  = true
  pd_type                 = "pd-standard"
  pd_size_gb              = 25

}
