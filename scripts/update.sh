#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$PROJECT_ROOT/docker"


echo "[INFO] Pulling latest images..."

docker compose pull


echo "[INFO] Restarting containers..."

docker compose up -d


echo "[SUCCESS] Update completed."