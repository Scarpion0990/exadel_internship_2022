#!/bin/bash
sudo apt update
sudo apt install apache2 -y
OS_VERSION=$(cat /proc/version)
DISK_FREE=$(df -h)
DISK_USAGE=$(du -h)
ALL_PROCCESSES=$(ps -aux)

#Docker installation
sudo apt-get -y update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

echo "<html><body><center><h1><p>Hello World <br> $OS_VERSION</p> <br> <pre> $DISK_FREE </pre> <br> <pre> $DISK_USAGE </pre> <br> <pre> $ALL_PROCCESSES </pre></h1></center></body></html>" > /var/www/html/index.html

sudo service apache2 start
