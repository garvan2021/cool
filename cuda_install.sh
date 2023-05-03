#!/bin/bash

source /etc/os-release

DISTRIBUTION=$ID$(echo $VERSION_ID | tr -dc '0-9')
DEB_URL=https://developer.download.nvidia.com/compute/cuda/repos/$DISTRIBUTION/$(uname -m)/
DEB_FILE=cuda-keyring_1.0-1_all.deb


wget $DEB_URL$DEB_FILE
dpkg -i $DEB_FILE
apt update
apt install -y cuda

rm -f *.deb*
