#!/usr/bin/env bash
set -euo pipefail

if [ -f "/home/${USER}/project/requirements.txt" ]; then
  python3 -m pip install --upgrade pip
  python3 -m pip install -r /home/${USER}/project/requirements.txt
fi

exec /bin/bash
