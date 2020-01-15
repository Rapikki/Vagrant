variable "organization_id" {}

variable "folder_name" {}

variable "project_id" {}

variable "credentials" {}

variable "region" {
  default = "us-central1"
}
variable "billing_account" {}

variable "bucket_name" {
  default = ["dnipro-001",
             "dnipro-002",
             "dnipro-003",
             "odessa-001",
             "odessa-002",
             "odessa-003",
             "kiev-001",
             "kiev-002",
             "kiev-003",
             "lviv-001",
             "lviv-002",
             "lviv-003",
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
