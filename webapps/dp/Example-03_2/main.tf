module "folder" {
  source             = "./modules/create_folder"
  folder_name        = var.folder_name
  organization_id    = var.organization_id
}

module "project" {
  source              = "./modules/create_project"
  name                = var.project_id
  project_id          = var.project_id
  folder_id           = module.folder.out_folder_id
  billing_account     = var.billing_account
  services            = var.services
  }

module "storage_bucket" {
  source              = "./modules/create_storage_bucket"
  bucket_name         = var.bucket_name
  location            = var.location
  project             = module.project.out_project_id
  api_enable          = module.project.api_services_enable
}







