#https://vegibit.com/how-to-provision-nginx-using-vagrant/
#apt-get -y update
#apt-get -y install nginx
#service nginx start

sudo add-apt-repository ppa:vbernat/haproxy-1.8
sudo apt-get -y update
sudo apt-get install haproxy -y

sudo cp webapps/haproxy.cfg /etc/haproxy/haproxy.cfg

haproxy -c -f /etc/haproxy/haproxy.cfg

sudo service haproxy restart