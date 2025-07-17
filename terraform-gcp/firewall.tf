# resource "google_compute_firewall" "sonarqube_allow_9000" {
#   name    = "sonarqube-allow-9000"
#   network = "default" # or var.network_name if you use custom VPC

#   allow {
#     protocol = "tcp"
#     ports    = ["9000"]
#   }
# 
#   direction     = "INGRESS"
#   priority      = 1000
#   source_ranges = ["0.0.0.0/0"] # Or restrict to specific CIDRs
#   target_tags   = ["sonarqube"]
#   description   = "Allow HTTP traffic to SonarQube (port 9000)"
# }
