#!/bin/bash

# Update system
sudo yum update -y

# Install Java (required for Jenkins)
sudo amazon-linux-extras install java-openjdk11 -y

# Install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
  https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Install Docker
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker

# Add ec2-user to docker group
sudo usermod -aG docker ec2-user
sudo usermod -aG docker jenkins
