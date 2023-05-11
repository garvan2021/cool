#!/bin/bash
#* Automate download ubuntu software from network *#
#* Garvan2021 *#

USER_EMAIL="j14nw14@gmail.com"
USER_NAME="garvan2021"

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

