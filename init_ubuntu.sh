#!/bin/bash
#* Automate download basic ubuntu software from network *#
#* Garvan2021 *#

USER_EMAIL="j14nw14@gmail.com"
USER_NAME="garvan2021"

# shellcheck source=/dev/null
source /etc/os-release

# shellcheck source=/dev/null
source common.sh

DISTRIBUTION=$ID$(echo "$VERSION_ID" | tr -dc '0-9')
DEB_URL=https://developer.download.nvidia.com/compute/cuda/repos/$DISTRIBUTION/$(uname -m)/
DEB_FILE=cuda-keyring_1.0-1_all.deb

apt_install() {
  apt-get update
  if ! apt-get install -y "$@"; then
    exit_failure error occurs in "$@" installation
  fi
}

init_git() {
  ## Init git config
  apt_install git

  git config --global user.email $USER_EMAIL
  git config --global user.name $USER_NAME
}

install_cuda() {
  apt_install wget dpkg

  wget "$DEB_URL$DEB_FILE"
  dpkg -i $DEB_FILE

  apt_install cuda
  rm -f -- *deb*
}

install_vscode() {
  apt_install snap
  snap install --classic code
}

install_chrome() {
  ## Install chrome stable using apt-get
  ## this method is referrence from:https://www.wikihow.com/Install-Google-Chrome-Using-Terminal-on-Linux
  apt_install wget dpkg

  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i google-chrome-stable_current_amd64.deb
  apt-get install -f -y
  rm -f google-chrome*
}

main() {
  init_git
  install_vscode
  install_chrome
}

if [ "$0" == "${BASH_SOURCE[0]}" ]; then
  main
fi

