# Remove wav_output and midi_output folders and their contents
Remove-Item -Path "wav_output" -Recurse -Force
Remove-Item -Path "midi_output" -Recurse -Force

New-Item -ItemType Directory -Path ".\wav_output"
New-Item -ItemType Directory -Path ".\midi_output"

Get-ChildItem ".\audio_input" -Filter *.mp3 | ForEach-Object {
    $outputFile = ".\wav_output\$($_.BaseName).wav"
    if (-Not (Test-Path $outputFile)) {
        ffmpeg -y -i $_.FullName $outputFile
    }
}

docker compose -f demucs.docker-compose.yaml run --rm demucs
docker compose -f basicpitch.docker-compose.yaml run --rm basicpitch
docker compose -f lilypond.docker-compose.yaml run --rm lilypond
