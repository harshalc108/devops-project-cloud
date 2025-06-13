#output "instance_name" {
#  value = google_compute_instance.default.name
#}
#output "public_ip" {
#  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
#}

output "instance_names" {
  description = "List of instance names"
  value = [
    for instance in google_compute_instance.default :
    instance.name
  ]
}

output "public_ips" {
  description = "List of external IPs for all instances"
  value = [
    for instance in google_compute_instance.default :
    instance.network_interface[0].access_config[0].nat_ip
  ]
}
