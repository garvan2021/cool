#!/bin/bash

UBUNTU_URL="https://releases.ubuntu.com/"
UBUNTU_VERSION="20.04"
UBUNTU_NAME="focal"
UBUNTU_SERVER=false

help() {
  echo "===== Burn Ubuntu ISO file into usb ====="
  echo "Usage: burn_iso.sh [option]... USB_PATH"
  echo "Burn Ubuntu iso file into USB_PATH. "
  echo "Options:"
  echo "  -v VERSION  Specify Ubuntu version to VERSION in"
  echo "              [bionic|focal|jammy|lunar], Defaults to focal"
  echo "  --server    Install Ubuntu Server without GUI Desktop"
  echo "Example:"
  echo "  $ ./burn_iso /dev/sda  # Burn Ubuntu20.04 Desktop to /dev/sda"
  echo "  $ ./burn_iso -v bionic --server /dev/sda" \
       "  # Burn Ubuntu18.04 server to /dev/sda"
}

main () {
  init_env $@
  case $1 in
    -h | --help) help;;
    -v) export UBUNTU_NAME=$2
  esac

# #   if 
#   if [ "$1" == "bionic" ]; then
#     burn_iso bionic 18.04
#   elif [ "$1" == "jammy" ]; then
#     burn_iso jammy 22.04
#   elif [ "$1" == "lunar" ]; then
#     burn_iso lunar 23.04
#   else
#     burn_iso focal 20.04
#   fi
}

burn_iso() {
  export UBUNTU_NAME="$1"
  export UBUNTU_VERSION="$2"
  UBUNTU_DESKTOP="ubuntu-${UBUNTU_VERSION}.6-desktop-amd64.iso"
  UBUNTU_SERVER="ubuntu-${UBUNTU_VERSION}.6-live-server-amd64.iso"
  ISO_URL="${UBUNTU_URL}${UBUNTU_NAME}/${UBUNTU_DESKTOP}"

  wget $ISO_URL

  
}

exit_failure() {
  exit 1
}

exit_success() {
  exit 0
}

if [ "$0" == "${BASH_SOURCE[0]}" ]; then
  main $@
fi
