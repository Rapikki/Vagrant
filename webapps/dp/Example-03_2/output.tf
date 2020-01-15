output "folder_info" {
value = module.folder.out_folder_id
}

output "project_info" {
  value = module.project.out_project_id
}

output "backet_info" {
  value = module.storage_bucket.out_create_storage_bucket
}