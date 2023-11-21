#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    sudo apt-get update -y
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    sudo apt-get install -y docker-ce

    # Start Docker
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo apt-get install awscli -y

    # Add the current user to Docker group
    sudo usermod -aG docker ubuntu
    echo "Docker installed successfully."
fi
    echo "Docker Found"

if ! command -v aws &>/dev/null; then
    echo "AWS CLI not found. Installing AWS CLI..."
    sudo apt-get update -y
    sudo apt-get install awscli -y
fi
    echo "AWS CLI is already installed."
