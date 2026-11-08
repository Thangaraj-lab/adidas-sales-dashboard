#!/usr/bin/env bash
# Launches Claude Code against the local NVIDIA proxy (start-proxy.sh must be running)
set -euo pipefail
cd "$(dirname "$0")"
set -a; . ./.env; set +a
export ANTHROPIC_BASE_URL="http://localhost:4000"
export ANTHROPIC_AUTH_TOKEN="$LITELLM_MASTER_KEY"
export ANTHROPIC_MODEL="nvidia-coder"
export ANTHROPIC_SMALL_FAST_MODEL="nvidia-fast"
exec claude "$@"
