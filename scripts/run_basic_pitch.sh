#!/bin/bash
set -e

echo "Starting WAV → MIDI transcription"

WAV_DIR="/wav_output"
OUTPUT_DIR="/midi_output"

mkdir -p "$WAV_DIR" "$OUTPUT_DIR"
basic-pitch --help >"${OUTPUT_DIR}/basic_pitch_help.txt" 2>&1

rm $OUTPUT_DIR/*.mid || true
basic-pitch --no-melodia --minimum-note-length 10 --minimum-frequency 82 $OUTPUT_DIR $WAV_DIR/htdemucs/*.wav
basic-pitch --no-melodia --minimum-note-length 10 --minimum-frequency 82 $OUTPUT_DIR $WAV_DIR/*.wav
