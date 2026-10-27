#!/usr/bin/env bash

app_env=${APP_ENV:-"dev"}
port=${PORT:-8000}

echo "APP_ENV: ${app_env}, PORT: ${port}"

if ! command -v python3 >/dev/null; then
  echo "Cannot find python3 installed"
  exit 1
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

log_file="${script_dir}/server.log"


echo "正在啟動伺服器，log 輸出至 ${log_file}"

python3 -m http.server "$port" --directory "$script_dir" >"$log_file" 2>&1 &

server_pid=$!
echo "伺服器啟動中，PID: ${server_pid}"

pid_file="${script_dir}/server.pid"
echo "$server_pid" > "$pid_file"

