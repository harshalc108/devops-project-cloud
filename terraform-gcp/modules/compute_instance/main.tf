resource "google_compute_disk" "default" {
  count = var.enable_persistent_disk ? var.replica_count : 0

  name  = "${var.instance_name}-persistent-${count.index}"
  type  = var.pd_type
  zone  = var.zone
  size  = var.pd_size_gb
}

resource "google_compute_instance" "default" {
  count        = var.replica_count
  #name         = var.instance_name 
  name         ="${var.instance_name}-${count.index}"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    device_name = "disk-0"
    initialize_params {
      image = var.image
      size  = 20 # Default boot disk size in GB
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

   #metadata = {
   #startup-script = file("${path.root}/startup-scripts/ubuntu_startup.sh")
  #}

  tags = var.tags

  dynamic "attached_disk" {
    for_each = var.enable_persistent_disk ? [google_compute_disk.default[count.index].self_link] : []
    content {
      source      = attached_disk.value
      device_name = "persistent-disk-0"
    }
  }
}
