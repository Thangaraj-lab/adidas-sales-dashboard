# Claude Code on an NVIDIA API key

Claude Code speaks the Anthropic API; NVIDIA NIM speaks OpenAI's. LiteLLM translates.

1. `cp .env.example .env` and put your key from build.nvidia.com in `NVIDIA_API_KEY` (never commit `.env`).
2. Terminal A: `./start-proxy.sh`
3. Terminal B: `./claude-nvidia.sh` (run from the project you want to work on, or `cd` after launch).

Change the model in `litellm_config.yaml`. Expect weaker tool use than real Claude models,
and NVIDIA free-tier rate limits. Requires the `claude` CLI installed locally.

## Verified (2026-11-08)
Tested end to end: Anthropic `/v1/messages` -> LiteLLM -> NVIDIA NIM, including a tool call
(`tool_use` block returned correctly). Working models for the tested key: nemotron-3-ultra-550b,
nemotron-3.5-lightning-30b, minimax-m3.1-flash. Several catalog models (e.g. kimi-k2.6) returned
404 "Function not found for account", so availability is per account. List yours with:
`curl -H "Authorization: Bearer $NVIDIA_API_KEY" https://integrate.api.nvidia.com/v1/models`
Not tested: a full interactive Claude Code session (needs the local `claude` CLI).

## Always use NVIDIA in this project
Run once on your machine: `./use-nvidia-by-default.sh`. It writes `.claude/settings.local.json`
(git-ignored) so plain `claude` in this repo uses the NVIDIA models. Start the proxy first
(`./start-proxy.sh`); if it isn't running, Claude Code shows connection errors. Undo: delete that file.
