#!/bin/bash
set -e
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "[INFO] Restarting Jellyfin..."

"$PROJECT_ROOT/scripts/stop.sh"

"$PROJECT_ROOT/scripts/start.sh"