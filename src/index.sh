#!/usr/bin/env bash
set -euo pipefail

if [ $# != 1 ]; then
  echo "Usage: anc [file]"
  exit 1
fi

current_directory="$(pwd)"

while :; do
  current_file="${current_directory%/}/$1"

  if [ -e "${current_file}" ]; then
    echo "${current_file}"
    exit
  fi

  if [ "${current_directory}" == "/" ]; then
    echo "$1 is not found in ancestor directories."
    exit 1
  fi

  current_directory="$(dirname "${current_directory}")"
done
