#!/bin/bash
yum -y update
yum -y install httpd
OS_VERSION=$(cat /proc/version)
DISK_FREE=$(df -h)
DISK_USAGE=$(du -h)
ALL_PROCCESSES=$(ps -aux)
echo "<html><body><center><h1><p>Hello World <br> $OS_VERSION</p> <br> <pre> $DISK_FREE </pre> <br> <pre> $DISK_USAGE </pre> <br> <pre> $ALL_PROCCESSES </pre></h1></center></body></html>" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
