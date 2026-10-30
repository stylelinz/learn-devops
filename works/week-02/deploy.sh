#!/usr/bin/env bash

app_env=${APP_ENV:-"dev"}
port=${PORT:-8000}

echo "APP_ENV: ${app_env}, PORT: ${port}"

used_pid=

if command -v lsof >/dev/null; then
  used_pid=$(lsof -i tcp:${port} -s tcp:listen -t)
fi

if [ -n "$used_pid" ]; then
  echo "PORT ${port} is used, PID: ${used_pid}"
  kill $used_pid
  retry_limit=3
  while lsof -i tcp:${port} -s tcp:listen -t >/dev/null; do
    if [ "$retry_limit" -le 0 ]; then
      echo "ERROR: retry limit exceeded"
      exit 1
    fi
    sleep 0.2
    retry_limit=$((retry_limit - 1))
  done
fi

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

check_retry_limit=3
while ! "${script_dir}/healthcheck.sh" "$port" &>/dev/null; do
  if [[ $check_retry_limit -le 0 ]]; then
    echo "failed: exceed retry limit"
    kill "$server_pid"
    exit 1
  fi
  sleep 0.2
  check_retry_limit=$((check_retry_limit - 1))
done

echo "healthcheck OK (status: 200)"
