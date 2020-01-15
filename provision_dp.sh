# dont forget to install vagrant plugin install vagrant-vbguest

sudo apt update

#download the package lists from the repositories and update them:
sudo apt-get update
sudo apt-get install unzip

wget https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip
sudo unzip terraform*.zip
sudo mv terraform /bin/
terraform --version