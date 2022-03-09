#!/bin/bash
            
sudo apt update

sudo apt install httpd -y

sudo service httpd start
sudo service httpd restart
sudo service httd enable
chkconfig httpd on

cd /var/www/html

echo "<html><h1>Hello  Welcome To My Webpage VIA TERRAFORM </h1></html>" > index.html