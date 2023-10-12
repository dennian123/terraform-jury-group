#!/bin/bash

sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

#install terraform
sudo wget https://releases.hashicorp.com/terraform/1.6.0/terraform
sudo unzip terraform/1.6.0/terraform
sudo mv terraform /usr/local/bin

#install packer
sudo wget https://releases.hashicorp.com/packer/1.9.4/packer_1.9.4_linux_amd64.zip
sudo unzip packer_1.9.4_linux_amd64.zip
sudo mv packer /usr/local/bin