#!/bin/bash
# Install nvidia-docker on remote Ubuntu machine

usage="Usage:
$(basename $0) <remote address>"

if [[ $# -lt 1 ]]; then
	echo "$usage"
	exit 1
fi

echo "Installing docker on $1"
scp * $1:
ssh $1 ./docker_ubuntu.sh