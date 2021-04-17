#! /bin/bash
sudo dnf install -y java-1.8.0-openjdk-devel
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo dnf install -y jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io