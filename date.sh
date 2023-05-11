#!/bin/sh
function createFilesWithDate {
   me=`basename "$0"`;
   for i in {1..100}; do
    echo log${i}.txt $(date) $me > log${i}.txt;
 done;
}
while test $# -gt 0; do
  case "$1" in
    --date)
    shift
     DATE=$(date) ; echo “Aktualna data: ${DATE}”
     ;;   
     --logs) 
     shift
     createFilesWithDate
     ;;
    *)
      break
      ;;
  esac
done