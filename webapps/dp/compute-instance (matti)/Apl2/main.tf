#module "create_project" {
  #source = "./modules/create_project"
  #name                = var.project_id
  #project_id          = var.project_id
  #folder_id           = var.folder_id
  #billing_account     = var.billing_account
  #services            = var.services
#}
# We create a public IP address for our google compute instance to utilize
resource "google_compute_address" "static" {
  name = "vm-public-ip-address"
}

# This creates the google instance
resource "google_compute_instance" "vm_instance" {
  name         = var.compute_instance_name
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
      nat_ip = google_compute_address.static.address
    }
  }

  metadata = {
      ssh-keys = "${var.ssh_user}:${file("${var.public_key_path}")}"
  }

 #---------------Install terraform: First way------------------------------------
  #metadata_startup_script = <<SCRIPT
  #sudo apt-get -y update
  #sudo apt-get -y install unzip
  #wget https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip
  #unzip terraform_0.12.9_linux_amd64.zip
  #sudo mv terraform /usr/local/bin/
  #SCRIPT


  /*
   data "template_file" "script" {
   template = file(var.terraform_script_path)}
   .
     resource "google_compute_instance" "vm_instance" {
   metadata_startup_script = data.template_file.script.rendered
  */


 #--------------Install kubectl: Second way----------------------------------------
  #provisioner "remote-exec" {
    #script = var.kubectl_script_path

    #connection {
      #type        = "ssh"
      #host        = google_compute_address.static.address
      #user        = var.ssh_user
      #private_key = file(var.private_key_path)

    #}
  #}
}


#--------------Install docker: Third way----------------------------------------
resource "null_resource" "provision-docker" {
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
