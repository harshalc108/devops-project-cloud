module "vm_instance" {
  source         = "./modules/compute_instance"
  instance_name  = "terraform-test-vm"
  replica_count  = 1
  zone           = var.zone
  tags           = ["terraform", "dev"]

}
