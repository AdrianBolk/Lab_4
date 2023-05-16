#!/bin/bash

function showHelp {
  echo "Dostępne opcje skryptu:"
  echo "--date: Wyświetla aktualną datę."
  echo "--logs [liczba]: Tworzy automatycznie podaną liczbę plików logx.txt, gdzie x to numer pliku od 1 do podanej liczby."
  echo "--help: Wyświetla wszystkie dostępne opcje."
  echo "--init: Klonuje całe repozytorium do katalogu, w którym został uruchomiony, i ustawia ścieżkę w zmiennej środowiskowej PATH."
  echo "--error [liczba], -e [liczba]: Tworzy podaną liczbę plików errorx/errorx.txt, gdzie x to numer pliku od 1 do podanej liczby. Bez podania liczby tworzy 100 plików."
  echo "-d, -h, -l: Skrócone wersje flag --date, --help, --logs."
  echo "Uwaga: --init nie będzie mergowane."
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