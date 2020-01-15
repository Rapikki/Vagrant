provider "google" {
  credentials      = var.credentials
  project          = var.project_id
  region           = var.region
}

resource "google_project" "project_test" {
  name             = var.project_id
  project_id       = var.project_id
  folder_id        = var.folder_id
  billing_account  = var.billing_account
}

resource "google_project_services" "project_services" {
  depends_on       = [google_project.project_test]
  project          = var.project_id
  services         = var.services
}

resource "google_storage_bucket" "storage_bucket_test" {
  depends_on       = [google_project_services.project_services]
  name             = var.storage_bucket_name
  location         = var.location
  project          = var.project_id

}



variable "project_id" {
  default = "project-test-example"
}
variable "services" {
  default = ["cloudbilling.googleapis.com",
  ]
}
variable "credentials" {
  default = "../sa-terraform.json"
}
variable "region" {
  default = "us-central1"
}
variable "billing_account" {
  default = "<variable>"
}
variable "folder_id" {
  default = "<variable>"
}
variable "storage_bucket_name" {
  default = "shop_storage"
}
variable "location" {
  default = "us"
}
