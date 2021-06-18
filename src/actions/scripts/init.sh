#!/bin/bash
##### Install Github actions runnner ######
# Create directories
mkdir actions-runner; cd actions-runner

# Download latest runner package
curl -O -L https://github.com/actions/runner/releases/download/v2.273.5/actions-runner-linux-x64-2.273.5.tar.gz

# Extract the installer
tar xzf ./actions-runner-linux-x64-2.273.5.tar.gz

# Configure the runner
./config.sh --url $REPOSITORY --token $REPOSITORY_TOKEN

# Install service for running always
sudo ./svc.sh install

# Starting the service
sudo ./svc.sh start

##### Install Docker #######
# Remove old docker versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Update VM to get latest packages
sudo apt-get update

# Install docker dependencies
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Install GPG Key
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Install new repo
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Add docker group
sudo groupadd docker

# Add current user to docker group
sudo usermod -aG docker $USER
