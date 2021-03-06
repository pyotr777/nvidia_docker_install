#!/bin/bash
# Install nvidia-docker on remote Ubuntu machine

usage="Usage:
$(basename $0) <remote address>"

if [[ $# -lt 1 ]]; then
	echo "$usage"
	exit 1
fi
set -e
echo "Installing nvidia-docker on $1"
scp * $1:
ssh $1 ./nvidia_docker_ubuntu.sh

echo "Running tests"
ssh $1 ./nvidia_docker_ubuntu_tests.sh
