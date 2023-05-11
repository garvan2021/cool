#!/bin/bash
#* Automate download basic ubuntu software from network *#
#* Garvan2021 *#

USER_EMAIL="j14nw14@gmail.com"
USER_NAME="garvan2021"

source /etc/os-release

DISTRIBUTION=$ID$(echo $VERSION_ID | tr -dc '0-9')
DEB_URL=https://developer.download.nvidia.com/compute/cuda/repos/$DISTRIBUTION/$(uname -m)/
DEB_FILE=cuda-keyring_1.0-1_all.deb

install_requirements() {
  ## Prerequisite softwares to install other ones
  apt-get update
  apt-get install -y wget git snap dpkg
}

init_git() {
  ## Init git config
  git config --global user.email $USER_EMAIL
  git config --global user.name $USER_NAME
}

install_cuda() {
  wget $DEB_URL$DEB_FILE
  dpkg -i $DEB_FILE
  apt update
  apt install -y cuda
  rm -f *.deb*
}

install_vscode() {
  ## Install vscode using snap
  snap install --classic code
}

install_chrome() {
  ## Install chrome stable using apt-get
  ## this method is referrence from:https://www.wikihow.com/Install-Google-Chrome-Using-Terminal-on-Linux
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i google-chrome-stable_current_amd64.deb
  apt-get install -f
  rm -f google-chrome*
}

main() {
  install_requirements
  
  init_git

  install_vscode
  install_chrome
  echo "Installation finished."
}

if [ "$0" == "${BASH_SOURCE[0]}" ]; then
  main
fi

