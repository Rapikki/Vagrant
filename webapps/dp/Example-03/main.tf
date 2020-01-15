module "create_project" {
  source = "./modules/create_project"
  name                = var.project_id
  project_id          = var.project_id
  folder_id           = var.folder_id
  billing_account     = var.billing_account
  services            = var.services
}

module "create_storage_bucket" {
  source              = "./modules/create_storage_bucket"
  bucket_name         = var.bucket_name
  location            = var.location
  project             = module.create_project.out_project_id
  api_enable          = module.create_project.api_services_enable
}







