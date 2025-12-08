#!/bin/sh
printf '\033c\033]0;%s\a' brick-breaker
base_path="$(dirname "$(realpath "$0")")"
"$base_path/brick-breaker-linux.x86_64" "$@"
