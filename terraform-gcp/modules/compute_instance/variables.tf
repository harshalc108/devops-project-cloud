variable "instance_name" {}
variable "machine_type" {
  default = "e2-micro"
}
variable "zone" {}
variable "image" {
  default = "debian-cloud/debian-11"
}
variable "tags" {
  type    = list(string)
  default = []
}
