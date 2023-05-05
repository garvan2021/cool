#!/bin/bash
#* Automate download ubuntu software from network *#
#* Garvan2021 *#

USER_EMAIL="j14nw14@gmail.com"
USER_NAME="garvan2021"

install_requirements() {
  ## Prerequisite softwares to install other ones
  apt-get update
  apt-get install -y wget git snap
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
  ## this method is referrence from:https://askubuntu.com/questions/510056/how-to-install-google-chrome
  wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O /tmp/google.pub
  gpg --no-default-keyring --keyring /etc/apt/keyrings/google-chrome.gpg --import /tmp/google.pub
  echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
  apt-get update
  apt-get install google-chrome-stable
}

main() {
  install_requirements
  
  init_git

  install_vscode
  install_chrome
}

# if [ "$0" == "$BASH_SCRIPT

main

