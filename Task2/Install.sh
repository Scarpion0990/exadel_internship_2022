#!/bin/bash
yum -y update
yum -y install httpd
OS_VERSION=$(cat /proc/version)
echo "<html><body><center><h1><p>Hello World <br> $OS_VERSION</p></h1></center></body></html>" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
