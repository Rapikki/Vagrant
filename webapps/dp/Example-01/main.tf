#module "create_project" {
  #source = "./modules/create_project"
  #name                = var.project_id
  #project_id          = var.project_id
  #folder_id           = var.folder_id
  #billing_account     = var.billing_account
  #services            = var.services
#}
# We create a public IP address for our google compute instance to utilize
#resource "google_compute_address" "static" {
#  name = "vm-public-ip-address"
#}

# This creates the google instance
resource "google_compute_instance" "vm_instance" {
  name         = "server-${count.index}"
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
      #      nat_ip = google_compute_address.static.address
    }
  }

  metadata = {
      ssh-keys = "${var.ssh_user}:${file("${var.public_key_path}")}"
  }
count = 4
}





#--------------Install docker: Third way----------------------------------------
/*resource "null_resource" "provision-docker" {
  depends_on = [google_compute_instance.vm_instance]

  provisioner "remote-exec" {
    script = var.docker_script_path

    connection {
      type        = "ssh"
      host        = google_compute_address.static.address
      user        = var.ssh_user
      private_key = file(var.private_key_path)

    }
  }
}
*/
