provider "google" {
  credentials = var.credentials
  project     = var.project_id
  region      = var.region
}
