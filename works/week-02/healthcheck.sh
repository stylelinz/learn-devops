#!/usr/bin/env bash

port=${1:-8000}
if [[ $(curl -w "%{http_code}\n" http://localhost:${port} -s -o /dev/null) -ne 200 ]]; then
  echo "healthcheck failed"
  exit 1
fi
