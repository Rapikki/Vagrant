resource "google_folder" "folder_test" {
  display_name     = var.folder_name
  parent           = var.organization_id
}
