#!/bin/bash

# shellcheck source=/dev/null
source init_ubuntu.sh

test_install_miniconda() {
  install_requirements
  
  return 1
}


if ! test_install_miniconda; then
  echo failed
fi
