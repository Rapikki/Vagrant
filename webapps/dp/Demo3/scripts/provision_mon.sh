#java
sudo apt update
#sudo apt-get install -y python-software-properties debconf-utils
sudo apt install default-jdk -y

#elasticsearch

sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
#Если у вас нет пакета apt-transport-https, то надо установить:

sudo apt install apt-transport-https
#Добавляем репозиторий Elasticsearch в систему:

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
#Устанавливаем Elasticsearch на Debian или Ubuntu:

sudo apt update && apt-get install elasticsearch
#После установки добавляем elasticsearch в автозагрузку и запускаем.

sudo systemctl daemon-reload 
sudo systemctl enable elasticsearch.service 
sudo systemctl start elasticsearch.service
#Проверяем, запустился ли он:

sudo systemctl status elasticsearch.service
#Если все в порядке, то переходим к настройке Elasticsearch.

sudo netstat -tulnp | grep 9200


#Kibana
sudo wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
sudo echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update && apt install kibana

sudo sh -c "echo 'server.host: "192.168.0.199"' >> /etc/kibana/kibana.yml"



sudo systemctl daemon-reload
sudo systemctl enable kibana.service
sudo systemctl start kibana.service

sudo systemctl status kibana.service

#sudo netstat -tulnp | grep 5601


#logstash
sudo apt install logstash
sudo systemctl enable logstash.service

sudo systemctl start elasticsearch.service