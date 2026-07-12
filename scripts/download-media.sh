#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

MEDIA_DIR="$PROJECT_ROOT/media"
MOVIES_DIR="$MEDIA_DIR/Movies"

VIDEO_URL="https://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4"
VIDEO_FILE="$MOVIES_DIR/BigBuckBunny.mp4"


echo "[INFO] Creating media directories..."

mkdir -p "$MOVIES_DIR"
mkdir -p "$MEDIA_DIR/TVseries"


if [ -f "$VIDEO_FILE" ]; then
    echo "[INFO] Demo video already exists."
    exit 0
fi


echo "[INFO] Downloading demo video..."

if command -v wget &> /dev/null
then
    wget "$VIDEO_URL" -O "$VIDEO_FILE"

elif command -v curl &> /dev/null
then
    curl -L "$VIDEO_URL" -o "$VIDEO_FILE"

else
    echo "[ERROR] wget or curl is required."
    exit 1
fi


echo "[SUCCESS] Demo media downloaded."