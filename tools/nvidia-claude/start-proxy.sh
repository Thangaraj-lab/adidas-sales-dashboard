#!/usr/bin/env bash
# Starts the local Anthropic->NVIDIA translation proxy on :4000
set -euo pipefail
cd "$(dirname "$0")"
[ -f .env ] || { echo "Missing .env (copy .env.example and add your NVIDIA key)"; exit 1; }
set -a; . ./.env; set +a
python3 -m venv .venv 2>/dev/null || true
. .venv/bin/activate
pip install -q 'litellm[proxy]'
exec litellm --config litellm_config.yaml --port 4000
