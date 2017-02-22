#!/bin/bash
# Install Nvidia-docker on Ubuntu EC2 instance (tested on P2).

sudo apt-get update

# Install Cuda
sudo apt-get install -y nvidia-cuda-toolkit
nvcc --version

# Install Docker
./install_docker_ubuntu.sh

# Add user ubuntu to docker group
sudo usermod -aG docker ubuntu
docker --version

# Install nvidia-docker and nvidia-docker-plugin
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0/nvidia-docker_1.0.0-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

sudo apt install -y nvidia-modprobe


