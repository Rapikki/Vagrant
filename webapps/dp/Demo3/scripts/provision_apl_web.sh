# TODO Decide whether this should use Ubuntu or RHEL and then select an appropriate LTS release (AWS)
# TODO How do I set up a debugging port in Tomcat and guest VM?

# Installing Java OpenJDK 
sudo apt update
#sudo apt-get install -y python-software-properties debconf-utils
sudo apt install default-jdk -y



# Add Tomcat user
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

# Download Tomcat
cd /tmp
sudo apt-get -y install curl
curl -O http://mirror.cc.columbia.edu/pub/software/apache/tomcat/tomcat-9/v9.0.30/bin/apache-tomcat-9.0.30.tar.gz

# Extract into target directory
sudo mkdir /opt/tomcat
sudo tar xzvf apache-tomcat-9*tar.gz -C /opt/tomcat --strip-components=1

# Assign ownership over target directory
cd /opt/tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/

# Copy basic Tomcat configuration files
cd /home/vagrant
sudo cp webapps/context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
sudo cp webapps/context.xml /opt/tomcat/webapps/host-manager/META-INF/context.xml
sudo cp webapps/tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml

# Copy any webapps in the source folder
sudo cp webapps/*.war /opt/tomcat/webapps

# Copy service file and reload daemon
sudo cp webapps/tomcat.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start tomcat
sudo ufw allow 8080
sudo systemctl enable tomcat

# sudo systemctl status tomcat
# sudo sed -i -e 's=<Valve=<!--<Valve=g' /opt/tomcat/webapps/manager/META-INF/context.xml
# sudo sed -i -e 's=</Context>=--></Context>=g' /opt/tomcat/webapps/manager/META-INF/context.xml
# sudo sed -i -e 's=<Valve=<!--<Valve=g' /opt/tomcat/webapps/host-manager/META-INF/context.xml
# sudo sed -i -e 's=</Context>=--></Context>=g' /opt/tomcat/webapps/host-manager/META-INF/context.xml
# sudo update-java-alternatives -l