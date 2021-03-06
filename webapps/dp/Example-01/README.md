# terraform-google-compute-instance-public

Create public virtual machines on Google Cloud. The instance has an external IP address associated. Published in the [Terraform registry](https://registry.terraform.io/modules/ichundu/compute-instance-public/).

## Usage example:

Create VMs with public IP addresses and DNS A record alias. Machine type can be changed without destroying the boot disk.

1. Create a new directory for this terraform configuration
2. Create a main.tf, for example:
```ruby
# Configure the Google Cloud provider
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

# module "gc2" {}
```
3. ```terraform init```
4. ```terraform plan``` Boom! Credentials file missing.
5. Add your google cloud credentials in a .json file. [Getting started guide](https://www.terraform.io/docs/providers/google/getting_started.html#adding-credentials)

> Keep the Google Cloud credentials in a safe place. Don't push them to Git.

6. Adapt the Terraform variables in `main.tf` to match your Google cloud project name, and VM requirements. All optional parameters can be found in [variables.tf](./variables.tf).
5. Let terraform fire up the VM's:
```bash
terraform apply
```
6. Wait a few ~~minutes~~ seconds.
7. Connect using SSH (private key auth): `ssh -i <private key> <username>@<ip from output>`. Or: `ssh eimert@ansible-dev.cloud.eimertvink.nl`.
8. Break down the resources:
```bash
terraform destroy
```

## machine_type
Overview of choices for variable machine_type.
```
f1-micro
g1-small

n1-standard-1
n1-standard-2
n1-standard-4
n1-standard-8

n1-highmem-2
n1-highmem-4
n1-highmem-8

n1-highcpu-2
n1-highcpu-4
n1-highcpu-8
```
Values are derived from [Google cloud console REST API call examples](https://console.cloud.google.com/compute/instancesAdd). Click for CPU and memory details.
