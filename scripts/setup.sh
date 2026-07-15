#!/bin/bash

set -e


PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"


echo "================================="
echo " Jellyfin Server Setup"
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

echo "[INFO] Checking for updates..."

"$PROJECT_ROOT/scripts/update.sh"

echo "[INFO] Downloading demo media..."

"$PROJECT_ROOT/scripts/download-media.sh"


echo "[INFO] Starting Jellyfin..."

"$PROJECT_ROOT/scripts/start.sh"


echo
echo "Running infrastructure health check..."
echo

"$PROJECT_ROOT/scripts/status.sh"

echo ""
echo "================================="
echo " Setup completed!"
echo ""
echo " Open:"
echo " Jellyfin -> http://localhost:8096"
echo " Grafana -> http://localhost:3000"
echo "================================="
