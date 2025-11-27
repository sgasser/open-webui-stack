# Open WebUI + LiteLLM Stack

**ChatGPT-like interface. Your infrastructure. 100+ AI providers.**

Stop vendor lock-in. Get OpenAI, Claude, Gemini, local models—all in one self-hosted chat interface with cost controls, team management, and private web search.

**Why teams choose this:**
- Switch between 100+ LLM providers without changing your workflow
- Set spending limits and track costs across all providers
- Keep your data and API keys on your own servers
- Built-in web search—no Google/Bing API needed
- Production-ready with auto-HTTPS in 2 commands

## Stack

- [Open WebUI](https://github.com/open-webui/open-webui) - Chat interface
- [LiteLLM](https://github.com/BerriAI/litellm) - OpenAI proxy with tracking
- [SearXNG](https://github.com/searxng/searxng) - Privacy-respecting metasearch engine
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Caddy](https://caddyserver.com/) - Auto HTTPS

## Quick Start

### Local Development

```bash
cp .env.example .env
cp docker-compose.override.yml.example docker-compose.override.yml
docker compose up -d
```

Access at:
- **Open WebUI**: http://localhost:3000
- **LiteLLM Admin UI**: http://localhost:4000/ui

### Production

```bash
cp .env.example .env
# Edit .env with your domain names
docker compose up -d
```

Caddy handles HTTPS automatically via Let's Encrypt.

Access at:
- **Open WebUI**: https://your-domain.com
- **LiteLLM Admin UI**: https://api.your-domain.com/ui

## Configure LLM Models

After deployment (local or production):

1. Open LiteLLM Admin UI (`/ui` path)
2. Login with your `LITELLM_MASTER_KEY` from `.env`
3. Add provider credentials:
   - Go to **Models** → **LLM Credentials** → **Add Credential**
   - Select your provider (OpenAI, Anthropic, Azure, etc.)
   - Enter your API key (get from https://platform.openai.com/api-keys)
   - Click **Add Credential**
4. Add models:
   - Go to **Models + Endpoints** → **Add Model**
   - Select **Existing Credentials** dropdown
   - Choose the credential you just added
   - Configure model settings and save
5. Models will automatically appear in Open WebUI

## GPU Requirements

This stack supports NVIDIA GPUs for RAG acceleration (embedding and reranking).

### GPU Server Setup

1. Provision a GPU instance with Ubuntu 24.04 + CUDA 12.6 + Docker
2. Use `install.sh` as installation script, or run manually:

```bash
cd /opt
git clone https://github.com/sgasser/open-webui-stack.git
cd open-webui-stack
cp .env.example .env
# Edit .env with your secrets and domains
docker compose up -d
```

3. Monitor GPU usage:

```bash
watch -n 1 nvidia-smi
```

## RAG Configuration

Configure RAG models in **Admin UI → Settings → Documents**:

- **Embedding Model**: Set your preferred embedding model (e.g., `BAAI/bge-m3`)
- **Reranking Model**: Set reranking model (optional)
- Click the download button next to the model name to initialize

Models are downloaded on first use. GPU acceleration is automatic when CUDA is available
