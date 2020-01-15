variable "credentials" {}

variable "project_name" {
  type        = string
  description = "The name of the project to instanciate the instance at."
  default     = "demo3-265009"
}

variable "region_name" {
  type        = string
  description = "The region that this terraform configuration will instanciate at."
  default     = "us-central1"
  #default     = "europe-west1"
}

variable "zone_name" {
  type        = string
  description = "The zone that this terraform configuration will instanciate at."
  default     = "us-central1-a"
  #default     = "europe-west1-b"
}

variable "compute_instance_name" {
  type        = string
}

variable "machine_size" {
  type        = string
  description = "The size that this instance will be."
  default     = "n1-standard-1"
}

variable "image_name" {
  type        = string
  description = "The kind of VM this instance will become"
  #default     = "ubuntu-os-cloud/ubuntu-1804-lts"
  default     = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "private_key_path" {
  type        = string
  description = "The path to the private key used to connect to the instance"
}

variable "public_key_path" {
  type        = string
  description = "The path to the private key used to connect to the instance"
}

variable "ssh_user" {
  type        = string
  description = "The name of the user that will be used to remote exec the script"
}


variable "terraform_script_path" {
  type        = string
  default     = "scripts/script-terraform.sh"
}

variable "docker_script_path" {
  type        = string
  default     = "scripts/script-docker.sh"
}

variable "kubectl_script_path" {
  type        = string
  default     = "scripts/script-kubectl.sh"
}
variable "project_id" {}
variable "folder_id" {
  default = "<variable>"
}
variable "billing_account" {}
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
