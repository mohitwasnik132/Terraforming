#!/bin/bash


##This is official Docker Docs installation. https://docs.docker.com/engine/install/ubuntu/
#I just consolidated everything and added simple code to filter
sleep 30                          ##following a random idea
sudo apt update

sleep 10                          ## lets see if this is hampering
sudo apt-get install ca-certificates curl gnupg lsb-release 2>/dev/null



curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" nightly | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null



######### Install docker Engine #########

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

###############################################################################################################
VERSION_STRING=$(apt-cache madison docker-ce | awk -F "|" 'NR==1{print $2; exit}'|tr -d "[:space:]")      ##just a trial to catch latest string ;) 

## Call it dumb code. I know we already can get latest.. but having fun. Will find some use for this :D
###############################################################################################################



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
