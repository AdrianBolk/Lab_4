#!/bin/sh
while test $# -gt 0; do
  case "$1" in
    --date)
    shift
     DATE=$(date) ; echo “Aktualna data: ${DATE}”
     ;;   
    *)
      break
      ;;
  esac
done