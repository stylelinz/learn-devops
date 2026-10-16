#! /usr/bin/env bash
# set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "backup.sh </dir/path/> 只接受一個資料夾位置"
  exit 1
fi

if ! [ -e "$1" ]; then
  echo "$1 is not exist"
  exit 1
fi

if ! [ -d "$1" ]; then
  echo "$1 must be a directory"
  exit 1
fi

if command -v tar > /dev/null && command -v date > /dev/null ; then
  now=$(date "+%Y%m%d%H%M%S")
  tar -zcvf "$1_${now}.tar.gz" "$1"
  exit 0
fi

exit 1