resource "google_storage_bucket" "bucket_test" {
  depends_on       = [var.api_enable]
  count            = length(var.bucket_name)
  name             = var.bucket_name[count.index]
  location         = var.location
  project          = var.project

}

