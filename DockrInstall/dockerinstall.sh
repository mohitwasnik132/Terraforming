#!/bin/bash


sudo apt update

sudo apt-get install ca-certificates curl gnupg lsb-release 2>/dev/null



curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" nightly | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null



######### Install docker Engine #########

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

VERSION_STRING=$(apt-cache madison docker-ce | awk -F "|" 'NR==1{print $2; exit}'|tr -d "[:space:]")

sudo apt-get install docker-ce="${VERSION_STRING}" docker-ce-cli="${VERSION_STRING}" containerd.io




######### Setup Post Install to run docker without root priviledge #########

sudo groupadd docker
sudo usermod -aG docker $USER   #adds ubuntu to docker group
newgrp docker                   #Activate changes to group

#CHange OwnerShips to avoid warnings and errors

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

#Config to Boot on start

sudo systemctl enable docker.service
sudo systemctl enable containerd.service
