#! /usr/bin/env bash

if [ $# -eq 0 ]; then
  echo "Say hello to somebody. e.g."
  echo "> ./greet.sh Linux"
  echo "Greetings, Linux"
  exit 1
fi

echo "First guest, $1"

for per in "$@"
do
  echo "Greetings, $per"
done
