# Claude Code on an NVIDIA API key

Claude Code speaks the Anthropic API; NVIDIA NIM speaks OpenAI's. LiteLLM translates.

1. `cp .env.example .env` and put your key from build.nvidia.com in `NVIDIA_API_KEY` (never commit `.env`).
2. Terminal A: `./start-proxy.sh`
3. Terminal B: `./claude-nvidia.sh` (run from the project you want to work on, or `cd` after launch).

Change the model in `litellm_config.yaml`. Expect weaker tool use than real Claude models,
and NVIDIA free-tier rate limits. Requires the `claude` CLI installed locally.
