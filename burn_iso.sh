#!/bin/bash

UBUNTU_URL="https://releases.ubuntu.com/"
UBUNTU_VERSION="20.04.6"
UBUNTU_NAME="focal"
UBUNTU_SERVER=false

burn_iso() {
  export UBUNTU_NAME="$1"
  export UBUNTU_VERSION="$2"

  if [ -z $USB_PATH ]; then
    exit_failure "USB path not found: ${USB_PATH}"
  fi

  if $UBUNTU_SERVER; then
    ISO_NAME="ubuntu-${UBUNTU_VERSION}-live-server-amd64.iso"
  else
    ISO_NAME="ubuntu-${UBUNTU_VERSION}-desktop-amd64.iso"
  fi
    
  ISO_URL="${UBUNTU_URL}${UBUNTU_NAME}/${ISO_NAME}"

  echo "Downloading from ${ISO_URL}..."
  if ! wget $ISO_URL; then
    exit_failure "${ISO_NAME} download failed, " \
                 "it may due to download source has changed"
  fi
  echo "${ISO_NAME} download success. now write to usb disk..."
  dd bs=4M if=$ISO_NAME of=$USB_PATH status=progress oflag=sync
  echo "Successfully write system to usb disk."

  rm -f *.iso
}

exit_failure() {
  echo "Burn ISO failed."
  echo "$1"
  exit 1
}

exit_success() {
  echo "Burn ISO success."
  exit 0
}

help() {
  echo "===== Burn Ubuntu ISO file into usb ====="
  echo "Usage: burn_iso.sh [option]... USB_PATH"
  echo "Burn Ubuntu iso file into USB_PATH. "
  echo "Options:"
  echo "  -v VERSION  Specify Ubuntu version to VERSION in"
  echo "              [bionic|focal|jammy|lunar], Defaults to focal"
  echo "  -s          Install Ubuntu Server without GUI Desktop"
  echo "Example:"
  echo "  $ ./burn_iso /dev/sda  # Burn Ubuntu20.04 Desktop to /dev/sda"
  echo "  $ ./burn_iso -v bionic --server /dev/sda" \
       "  # Burn Ubuntu18.04 server to /dev/sda"
}

main () {

  # Here modified from: https://www.howtogeek.com/778410/how-to-use-getopts-to-parse-linux-shell-script-options/
  while getopts ':sv:' o; do
    case "$o" in
      s) export UBUNTU_SERVER=true;;
      v) export UBUNTU_NAME="$OPTARG";;
      ?) help exit_failure;;
    esac
  done
  
  shift "$(($OPTIND -1))"
  export USB_PATH=$1

  if [ -z $USB_PATH ]; then
    exit_failure "Please specify USB driver path: \"./burn_iso USB_PATH\""
  fi

  if [ $UBUNTU_NAME == "bionic" ]; then
    burn_iso bionic '18.04.6'
  elif [ $UBUNTU_NAME == "focal" ]; then
    burn_iso focal '20.04.6'
  elif [ $UBUNTU_NAME == "jammy" ]; then
    burn_iso jammy '22.04.2'
  elif [ $UBUNTU_NAME == "lunar" ]; then
    burn_iso lunar '23.04'
  else
    exit_failure "Illegal System version specified: ${UBUNTU_NAME}"
  fi
}

if [ "$0" == "${BASH_SOURCE[0]}" ]; then
  main $@
fi
