#!/usr/bin/env bash
shopt -s nullglob

OUTPUT_DIR="/midi_output"

midi2ly --help >${OUTPUT_DIR}/midi2ly_help.txt 2>&1
lilypond --help >${OUTPUT_DIR}/lilypond_help.txt 2>&1

for midi_file in "${OUTPUT_DIR}"/*.mid; do
    lilypond_file="${midi_file%.mid}.ly"
    echo "Converting $midi_file -> $lilypond_file"
    midi2ly --output="$lilypond_file" "$midi_file"
    echo "Rendering $lilypond_file -> PDF"
    lilypond --pdf "$lilypond_file"
done
