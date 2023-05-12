#!/bin/bash

main () {
  exit_success
}

exit_failure() {
  exit 1
}

exit_success() {
  exit 0
}

if [ "$0" == "${BASH_SOURCE[0]}" ]; then
  main "$@"
fi
