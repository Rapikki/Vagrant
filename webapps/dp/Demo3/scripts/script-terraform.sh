#install terraform
sudo mkdir /usr/bin/terraform && cd /usr/bin/terraform
sudo chown $(whoami) ./ && chmod -R 744 ./
curl -O https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip
echo y | unzip terraform_0.12.9_linux_amd64.zip && rm terraform_0.12.9_linux_amd64.zip
echo "export PATH=\"$PATH:/usr/bin/terraform\"" | sudo tee -a ~/.bashrc
source ~/.bashrc
