provider "google" {
  credentials = var.credentials
  project = var.project_name
  region  = var.region_name
  zone    = var.zone_name
}




module "compute-instance" {
  source  = "matti/compute-instance/google"
  version = "0.1.0"
  # insert the 7 required variables here
  amount = "3"

disk_image = "ubuntu-os-cloud/ubuntu-1804-lts"

disk_size = "10"

machine_type = "n1-standard-1"
name_prefix = "vm"

region = "us-central1"

user_data = ""


}
