variable "instance_name" {}
variable "machine_type" {
  default = "e2-medium"
  
}
variable "zone" {}
variable "image" {
  default = "ubuntu-os-cloud/ubuntu-2204-lts"
}
variable "tags" {
  type    = list(string)
  default = []
}
variable "replica_count" {
  description = "Number of VM instances to create"
  type        = number
  default     = 1
}

variable "enable_persistent_disk" {
  type    = bool
  default = false
}

variable "pd_type" {
  type    = string
  default = "pd-standard"
}

variable "pd_size_gb" {
  type    = number
  default = 30
}
