#!/bin/bash
set -e

echo "Starting WAV → WAV instrument demuxing"

WAV_DIR="/wav_output"
OUTPUT_DIR="/midi_output"

mkdir -p "$WAV_DIR" "$OUTPUT_DIR"
demucs --help >"${OUTPUT_DIR}/demucs_help.txt" 2>&1

rm $WAV_DIR/htdemucs/*.wav || true
for WAV_FILE in "$WAV_DIR"/*.wav; do
    demucs "$WAV_FILE" -o $WAV_DIR --filename "{track}-{stem}.{ext}"
done
