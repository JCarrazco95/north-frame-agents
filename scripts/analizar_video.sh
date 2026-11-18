#!/usr/bin/env bash
# Analiza un video de referencia: metadatos, hoja de frames, cortes de escena y loudness.
# Uso: bash scripts/analizar_video.sh <video> <carpeta_salida> [frames=8]
set -euo pipefail

VIDEO="${1:?Falta ruta del video}"
OUT="${2:?Falta carpeta de salida}"
N="${3:-8}"
mkdir -p "$OUT"
BASE="$(basename "${VIDEO%.*}")"

DUR="$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$VIDEO")"
IFS=, read -r W H FPS < <(ffprobe -v error -select_streams v:0 -show_entries stream=width,height,r_frame_rate \
  -of csv=p=0 "$VIDEO")

# Hoja de frames: N cuadros repartidos en el video, en una fila, con marca de tiempo.
ffmpeg -v error -y -i "$VIDEO" \
  -vf "fps=${N}/${DUR},scale=270:-1,drawtext=text='%{pts\\:hms}':x=6:y=6:fontsize=16:fontcolor=white:box=1:boxcolor=black@0.6,tile=${N}x1" \
  -frames:v 1 "$OUT/${BASE}_frames.jpg"

# Cortes de escena (umbral 0.3)
CUTS="$(ffmpeg -v info -i "$VIDEO" -vf "select='gt(scene,0.3)',showinfo" -f null - 2>&1 \
  | grep -o 'pts_time:[0-9.]*' | cut -d: -f2 | paste -sd, - || true)"

# Loudness integrado y pico real
LOUD="$(ffmpeg -nostats -i "$VIDEO" -af ebur128=peak=true -f null - 2>&1 | tail -n 12)"
I="$(echo "$LOUD" | grep -E '^\s+I:' | awk '{print $2}' | tail -n1)"
TP="$(echo "$LOUD" | grep -E '^\s+Peak:' | awk '{print $2}' | tail -n1)"

cat > "$OUT/${BASE}_analisis.json" <<EOF
{
  "archivo": "$VIDEO",
  "duracion_s": $DUR,
  "ancho": $W,
  "alto": $H,
  "fps": "$FPS",
  "cortes_s": [${CUTS}],
  "loudness_lufs": ${I:-null},
  "pico_dbtp": ${TP:-null},
  "hoja_frames": "$OUT/${BASE}_frames.jpg"
}
EOF
echo "$OUT/${BASE}_analisis.json"
