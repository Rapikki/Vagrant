
#installing gitlab ce
sudo apt update
sudo apt install ca-certificates curl openssh-server postfix
cd /tmp
curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh
sudo bash /tmp/script.deb.sh

apt install gitlab-ce

docker-compose --file ./webapps/docker-compose.yml up -d