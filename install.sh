#!/bin/bash
# Open WebUI Stack - Verda V100 Installation Script
# For: Ubuntu 24.04 + CUDA 12.6 + Docker

set -e

# Verify GPU access
nvidia-smi

# Clone the stack
cd /opt
git clone https://github.com/sgasser/open-webui-stack.git
cd open-webui-stack

# Create .env from example
cp .env.example .env

echo ""
echo "============================================"
echo "Installation complete!"
echo "============================================"
echo ""
echo "Next steps:"
echo "1. Edit /opt/open-webui-stack/.env with your secrets"
echo "2. Run: cd /opt/open-webui-stack && docker compose up -d"
echo "3. Watch logs: docker logs -f open-webui"
echo "4. Monitor GPU: watch -n 1 nvidia-smi"
echo ""
