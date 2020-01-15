#module "create_project" {
  #source = "./modules/create_project"
  #name                = var.project_id
  #project_id          = var.project_id
  #folder_id           = var.folder_id
  #billing_account     = var.billing_account
  #services            = var.services
#}
# We create a public IP address for our google compute instance to utilize
#resource "google_compute_address" "static_apl1" {
#  name = "vm-public-ip-address"
#}

# This creates the google instance
resource "google_compute_instance" "vm_instance_apl1" {
  name         = "apl1"
  machine_type = var.machine_size

  boot_disk {
    initialize_params {
      image = var.image_name
    }
  }

  network_interface {
    network       = "default"
    # Associated our public IP address to this instance
    access_config {
      nat_ip = ""
    }
  }

  metadata = {
      ssh-keys = "${var.ssh_user}:${file("${var.public_key_path}")}"
  }
}




resource "null_resource" "provision-tomcat_apl1" {
  depends_on = [google_compute_instance.vm_instance_apl1]

  provisioner "remote-exec" {
    connection {
      host        = "${google_compute_instance.vm_instance_apl1.network_interface.0.access_config.0.nat_ip}"
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_key_path)
      agent       = false
    }
    script = var.apl_script_path
  }
}
