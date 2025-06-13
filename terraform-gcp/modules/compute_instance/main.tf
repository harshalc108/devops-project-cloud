resource "google_compute_instance" "default" {
  count        = var.replica_count
  #name         = var.instance_name 
  name         ="${var.instance_name}-${count.index}"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  tags = var.tags
}
