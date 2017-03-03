#!/bin/sh
# Install Docker 1.13.1 on Ubuntu

sudo apt-get update
LINUX_VERSION=$(lsb_release -cs 2>/dev/null)
if [[ -z "$LINUX_VERSION" ]]; then
	echo "Not supported Linux version $LINUX_VERSION"
	exit 1
fi

case "$LINUX_VERSION" in
	xenial)
		link="https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.13.1-0~ubuntu-xenial_amd64.deb";
		;;
	trusty)
		link="https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.13.1-0~ubuntu-trusty_amd64.deb";
		;;
	precise)
		link="https://apt.dockerproject.org/repo/pool/main/d/docker-engine/docker-engine_1.13.1-0~ubuntu-precise_amd64.deb"
		;;
esac

if [[ -z "$link" ]]; then
	echo "Not supported Linux version $LINUX_VERSION"
	exit 1
fi

wget $link
filename=${link##*/}
echo "Installing  Docker 1.13.1"
sudo dpkg -i $filename
sudo apt-get install -f -y
sudo usermod -aG docker ubuntu
