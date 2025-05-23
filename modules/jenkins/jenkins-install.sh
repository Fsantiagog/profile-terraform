#!/bin/bash
sudo yum update -y
sudo yum install -y java-17-amazon-corretto
sudo wget -O /etc/yum.repos.d/jenkins.repo     https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa