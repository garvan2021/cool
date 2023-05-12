#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

echo_success() {
  printf ===========================================================
  echo -e "$@"
  printf ===========================================================
}

exit_failure() {
  echo -e "$RED$1$NC"
  exit 1
}
