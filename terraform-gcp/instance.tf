module "sonarqube" {
  source         = "./modules/compute_instance"
  instance_name  = "sonarqube-rh"
  replica_count  = 2
  zone           = var.zone
  tags           = ["terraform", "dev"]

}

module "worksoft" {
  source         = "./modules/compute_instance"
  instance_name  = "wpec5009wksft"
  replica_count  = 2
  zone           = var.zone
  tags           = ["terraform", "dev","worksoft"]

}
