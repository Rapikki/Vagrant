resource "google_project" "project_test" {
  name             = var.project_id
  project_id       = var.project_id
  folder_id        = var.folder_id
  billing_account  = var.billing_account
}

#resource "google_project_services" "project_services" {
#  depends_on       = [google_project.project_test]
#  project          = var.project_id
#  services         = var.services
#}
