#!/bin/bash

function showHelp {
  echo "Dostępne opcje skryptu:"
  echo "--date: Wyświetla aktualną datę."
  echo "--logs [liczba]: Tworzy automatycznie podaną liczbę plików logx.txt, gdzie x to numer pliku od 1 do podanej liczby."
  echo "--help: Wyświetla wszystkie dostępne opcje."
}
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
    --help)
    shift
    showHelp
    ;;
    *)
      break
      ;;
  esac
done