#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"


echo "[INFO] Stopping containers..."

cd "$PROJECT_ROOT/docker"

docker compose down


echo "[INFO] Removing generated data..."

rm -rf "$PROJECT_ROOT/config"
rm -rf "$PROJECT_ROOT/cache"
rm -rf "$PROJECT_ROOT/media/movies/Big\ Buck\ Bunny.mp4"


echo "[SUCCESS] Cleanup completed."