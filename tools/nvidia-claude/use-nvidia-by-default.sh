#!/usr/bin/env bash
# Makes Claude Code ALWAYS use the NVIDIA proxy models when run inside this project.
# Writes the git-ignored .claude/settings.local.json (local machine only, never committed).
# Undo: rm .claude/settings.local.json
set -euo pipefail
root="$(cd "$(dirname "$0")/../.." && pwd)"
mkdir -p "$root/.claude"
cat > "$root/.claude/settings.local.json" <<JSON
{
  "env": {
    "ANTHROPIC_BASE_URL": "http://127.0.0.1:4000",
    "ANTHROPIC_AUTH_TOKEN": "sk-local-nvidia-proxy",
    "ANTHROPIC_MODEL": "nvidia-coder",
    "ANTHROPIC_SMALL_FAST_MODEL": "nvidia-fast",
    "ANTHROPIC_DEFAULT_SONNET_MODEL": "nvidia-coder",
    "ANTHROPIC_DEFAULT_OPUS_MODEL": "nvidia-coder",
    "ANTHROPIC_DEFAULT_HAIKU_MODEL": "nvidia-fast"
  }
}
JSON
echo "Done. In this project, 'claude' now always uses NVIDIA models (start ./tools/nvidia-claude/start-proxy.sh first)."
