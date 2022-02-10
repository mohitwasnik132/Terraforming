#!/bin/bash




## Very straight forward script to install docker. 
##### This done on trial instance to check if my intended script has some bugs




sudo apt update
sudo apt upgrade
sudo apt-get install curl apt-transport-https ca-certificates software-properties-common



curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce




sudo apt install docker-ce




sudo systemctl start docker
sudo systemctl enable docker



