# Open WebUI + LiteLLM

## Stack

- Open WebUI - Chat interface
- LiteLLM - OpenAI proxy with tracking
- SearXNG - Privacy-respecting metasearch engine
- PostgreSQL 17 - Database
- Caddy 2 - Auto HTTPS

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
