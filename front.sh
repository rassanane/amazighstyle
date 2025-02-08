#!/bin/bash

########## script d'installation docker et conteneur produits-front ##########

#debug mode
set -x  # Enable debug mode
# Update package list
sudo apt update

# Install dependencies
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository
# yes : pour eviter press enter to continue
sudo add-apt-repository --yes "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Update package list again
sudo apt update

# Install Docker
sudo apt install -y docker-ce

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add your user to the docker group (optional, to run Docker without sudo)
sudo usermod -aG docker $USER

# Test Docker installation
docker --version

# Recuperation image
sudo docker pull rassanane/produits-front

# Install conteneur
#sudo docker run -d -p 80:80 rassanane/produits-front:latest
sudo docker run -d -p 4200:80 rassanane/produits-front:latest

echo "Fin installation"



# Il faut ouvrir le port 4200

# Execution du script
# sudo nano front.sh
# sudo chmod +x front.sh
# sudo ./front.sh

# Test
# http://44.222.151.213:4200/
