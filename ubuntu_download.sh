#!/bin/bash
#* Automate download ubuntu software from network *#
#* Garvan2021 *#

USER_EMAIL="j14nw14@gmail.com"
USER_NAME="garvan2021"

install_requirements() {
  apt-get update
  apt-get install -y wget git snap
}

init_git() {
  git config --global user.email $USER_EMAIL
  git config --global user.name $USER_NAME
}

# install_vscode() {
  snap install --classic code
}

# install_chrome() {}

main() {
  install_requirements
  
  init_git

  # install_vscode
  # install_chrome
}

# if [ "$0" == "$BASH_SCRIPT

main

