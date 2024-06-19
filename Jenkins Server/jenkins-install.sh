#!/bin/bash

# install jenkins
sudo apt update -y
sudo wget -O /etc/apt.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo apt upgrade -y
sudo amazon-linux-extras install java-openjdk11 -y
sudo apt install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

# then install git
sudo apt install git -y

#then install terraform
sudo apt install -y apt-utils
sudo apt-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo apt -y install terraform

#finally install kubectl
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mkdir -p $HOME/bin && sudo cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
