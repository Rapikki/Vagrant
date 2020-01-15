provider "google" {
  credentials = "${file("./sa-terraform.json")}"
  project     = "smashing-dash-1992"
}

module "vm1" {
  source          = "github.com/ichundu/terraform-gce-instance-public"
  amount          = 1
  region          = "europe-west4"
  zone            = "europe-west4-c"
  # hostname format: name_prefix-amount
  name_prefix     = "vm"
  machine_type    = "n1-standard-2"
  disk_type       = "pd-ssd"
  disk_size       = "15"
  disk_image      = "centos-cloud/centos-7"

  dns_record_name = "tower-dev"

  user_data       = "firestone-lab"
  username        = "eimert"
  public_key_path = "~/.ssh/id_rsa.pub"
}


resource "google_compute_address" "instances" {
  count  = "${var.amount}"
  name   = "${var.name_prefix}-${count.index}"
  region = "${var.region}"
}

resource "google_compute_disk" "instances" {
  count = "${var.amount}"

  name = "${var.name_prefix}-${count.index+1}"
  type = "${var.disk_type}"
  size = "${var.disk_size}"

  # optional
  zone = "${var.zone}"

  image = "${var.disk_image}"

  provisioner "local-exec" {
    command    = "${var.disk_create_local_exec_command_or_fail}"
    on_failure = "fail"
  }

  provisioner "local-exec" {
    command    = "${var.disk_create_local_exec_command_and_continue}"
    on_failure = "continue"
  }

  provisioner "local-exec" {
    when       = "destroy"
    command    = "${var.disk_destroy_local_exec_command_or_fail}"
    on_failure = "fail"
  }

  provisioner "local-exec" {
    when       = "destroy"
    command    = "${var.disk_destroy_local_exec_command_and_continue}"
    on_failure = "continue"
  }
}

# https://www.terraform.io/docs/providers/google/r/compute_instance.html
resource "google_compute_instance" "instances" {
  count = "${var.amount}"

  name         = "${var.name_prefix}-${count.index+1}"
  tags         = "${var.tags}"
  zone         = "${var.zone}"
  machine_type = "${var.machine_type}"

  boot_disk {
    source      = "${google_compute_disk.instances.*.name[count.index]}"
    auto_delete = false
 }

  # reference: https://cloud.google.com/compute/docs/storing-retrieving-metadata
  metadata = {
    description = "Managed by Terraform"
    user-data   = "${replace(replace(var.user_data, "$$ZONE", var.zone), "$$REGION", var.region)}"
    ssh-keys    = "${var.username}:${file("${var.public_key_path}")}"
  }

  network_interface {
    network    = "${var.network}"
    subnetwork = "${var.subnetwork}"

    access_config {
      nat_ip = "${google_compute_address.instances.*.address[count.index]}"
    }
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
    automatic_restart   = "${var.automatic_restart}"
  }

  allow_stopping_for_update = "true"
}
