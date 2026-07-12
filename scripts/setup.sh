#!/bin/bash

set -e


PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"


echo "================================="
echo " Jellyfin DevOps Setup"
echo "================================="


if ! command -v docker &> /dev/null
then
    echo "[ERROR] Docker is not installed."
    exit 1
fi


if ! docker compose version &> /dev/null
then
    echo "[ERROR] Docker Compose is not available."
    exit 1
fi


echo "[INFO] Downloading demo media..."

"$PROJECT_ROOT/scripts/download-demo-media.sh"


echo "[INFO] Starting Jellyfin..."

"$PROJECT_ROOT/scripts/start.sh"


echo ""
echo "================================="
echo " Setup completed!"
echo ""
echo " Open:"
echo " http://localhost:8096"
echo "================================="