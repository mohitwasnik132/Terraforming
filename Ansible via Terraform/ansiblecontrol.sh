Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"

#!/bin/bash


sudo apt update
sudo apt-get update
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install software-properties-common ansible python3 git  -y


# sudo yum install -y python3
# sudo yum install -y vim
# sudo yum install -y ansible
# sudo yum install -y git

# add user devops

sudo useradd -m -p $(openssl passwd -1 devops) -s /bin/bash -G sudo devops

# add user devops to sudoers list

echo -e "devops\tALL=(ALL:ALL)\tNOPASSWD:ALL" > /etc/sudoers.d/devops

#enable password authentication
sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config

# sudo service sshd restart
sudo systemctl restart sshd.service

echo "All done!"

