#!/bin/bash
# Test installation of nvidia-docker on Ubuntu

echo "Version:"
nvidia-docker --version

echo "ps ax:"
sudo ps ax | grep nvidia

#sudo chown ubuntu:docker /home/ubuntu/nohup.out
#sudo chmod 660 /home/ubuntu/nohup.out

# Test nvidia-smi
echo "nvidia-smi:"
nvidia-docker run --rm nvidia/cuda nvidia-smi
