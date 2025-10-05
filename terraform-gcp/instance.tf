# module "elk" {
#  source         = "./modules/compute_instance"
#  instance_name  = "elasticsearch-rh"
#  replica_count  = 1
#  zone           = var.zone
#  tags           = ["terraform", "dev", "elasticsearch","http-server", "https-server"]
#  #enable_persistent_disk  = true
#  #pd_type                 = "pd-standard"
#  #pd_size_gb              = 25

# }

# module "grafana" {
#  source         = "./modules/compute_instance"
#  instance_name  = "grafana-rh"
#  replica_count  = 1
#  zone           = var.zone
#  tags           = ["terraform", "dev", "grafana"]
#  #enable_persistent_disk  = true
#  #pd_type                 = "pd-standard"
#  #pd_size_gb              = 25

# }

# module "prometheus" {
#  source         = "./modules/compute_instance"
#  instance_name  = "prometheus-rh"
#  replica_count  = 1
#  zone           = var.zone
#  tags           = ["terraform", "dev", "prometheus"]
#  #enable_persistent_disk  = true
#  #pd_type                 = "pd-standard"
#  #pd_size_gb              = 25

# }

# module "sonarqube" {
#  source         = "./modules/compute_instance"
#  instance_name  = "sonarqube-rh"
#  replica_count  = 1
#  zone           = var.zone
#  tags           = ["terraform", "dev", "sonarqube"]
#  #enable_persistent_disk  = true
#  #pd_type                 = "pd-standard"
#  #pd_size_gb              = 25
# }



