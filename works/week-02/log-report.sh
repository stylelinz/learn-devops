#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

log_file="${script_dir}/server.log"

grep -oE '"\s[0-9]{3}' "${log_file}" | grep -oE '[0-9]{3}' | sort | uniq -c
