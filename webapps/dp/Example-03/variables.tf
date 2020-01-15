variable "project_id" {}

variable "credentials" {}

variable "region" {
  default = "us-central1"
}
variable "billing_account" {}

variable "folder_id" {
  default = "<variable>"
}
variable "bucket_name" {
  default = ["dnipro-1",
             "dnipro-2",
             "dnipro-3",
             "odessa-1",
             "odessa-2",
             "odessa-3",
             "kiew-1",
             "kiew-2",
             "kiew-3",
             "lviv-1",
             "lviv-2",
             "lviv-3",
  ]
}
variable "location" {
  default = "us"
}

variable "services" {
  default = ["cloudbilling.googleapis.com",
            "compute.googleapis.com",
            "cloudapis.googleapis.com",
            "servicemanagement.googleapis.com",
            "serviceusage.googleapis.com",
            "storage-api.googleapis.com",
            "storage-component.googleapis.com",
  ]
}
