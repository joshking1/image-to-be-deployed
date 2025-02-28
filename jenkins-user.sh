#!/bin/bash

# Update packages and install security patches
sudo apt-get update -y

# Start Docker daemon
sudo systemctl start docker 

# Enable Docker daemon to start at boot
sudo systemctl enable docker

# Add ec2-user to the docker group so you can execute Docker commands without using sudo
sudo usermod -a -G docker ubuntu

# Build the Docker image
docker build -t my-jenkins:latest .

# Tag the image
docker tag my-jenkins:latest josh1991/my-jenkins:latest

# Login to Docker Hub using environment variables
echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin

# Push the image to Docker Hub
docker push josh1991/my-jenkins:latest
