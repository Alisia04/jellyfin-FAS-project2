#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

BACKUP_DIR="$PROJECT_ROOT/backup"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")


mkdir -p "$BACKUP_DIR"


echo "[INFO] Creating backup..."

tar -czf "$BACKUP_DIR/jellyfin_backup_$DATE.tar.gz" \
    "$PROJECT_ROOT/config"


echo "[SUCCESS] Backup created:"
echo "$BACKUP_DIR/jellyfin_backup_$DATE.tar.gz"