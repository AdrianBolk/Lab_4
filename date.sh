#!/bin/bash

function createFilesWithDate {
  me=$(basename "$0")
  for ((i=1; i<=$1; i++)); do
    echo "log${i}.txt $(date) $me" > log${i}.txt
  done
}

while test $# -gt 0; do
  case "$1" in
    --date)
      shift
      DATE=$(date)
      echo "Aktualna data: ${DATE}"
      ;;
    --logs)
      shift
      if [[ $1 =~ ^[0-9]+$ ]]; then
        createFilesWithDate $1
      else
        echo "Błędny argument. Oczekiwano liczby plików."
      fi
      shift
      ;;
    *)
      break
      ;;
  esac
done
