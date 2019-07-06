sudo yum install -y docker net-tools firewalld

sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl start firewalld
sudo systemctl enable firewalld

sudo firewall-cmd --permanent --add-port 2376/tcp --add-port 8443/tcp --add-port 80/tcp
SUBNET=`sudo docker network inspect -f "{{range .IPAM.Config }}{{ .Subnet }}{{end}}" bridge`
sudo firewall-cmd --permanent --new-zone minishift
sudo firewall-cmd --permanent --zone minishift --add-source $SUBNET
sudo firewall-cmd --permanent --zone minishift --add-port 53/udp --add-port 8053/udp
sudo firewall-cmd --reload

sudo groupadd docker
sudo gpasswd -a $USER docker
sudo systemctl restart docker

exit
