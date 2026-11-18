#!/usr/bin/env bash
# QA técnico de un render o toma. Imprime PASA/FALLA por chequeo.
# Uso: bash scripts/qa_video.sh <video> [ancho_esperado=1080] [alto_esperado=1920]
set -euo pipefail

VIDEO="${1:?Falta ruta del video}"
EW="${2:-1080}"
EH="${3:-1920}"
FALLAS=0

IFS=, read -r W H < <(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 "$VIDEO")
DUR="$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$VIDEO")"
echo "Archivo: $VIDEO"
echo "Duración: ${DUR}s"
if [[ "$W" == "$EW" && "$H" == "$EH" ]]; then echo "PASA resolución ${W}x${H}"; else echo "FALLA resolución ${W}x${H} (esperado ${EW}x${EH})"; FALLAS=$((FALLAS+1)); fi

if ffprobe -v error -select_streams a -show_entries stream=codec_type -of csv=p=0 "$VIDEO" | grep -q audio; then
  LOUD="$(ffmpeg -nostats -i "$VIDEO" -af ebur128=peak=true -f null - 2>&1 | tail -n 12)"
  I="$(echo "$LOUD" | grep -E '^\s+I:' | awk '{print $2}' | tail -n1)"
  TP="$(echo "$LOUD" | grep -E '^\s+Peak:' | awk '{print $2}' | tail -n1)"
  if awk "BEGIN{exit !($I >= -15 && $I <= -13)}"; then echo "PASA loudness ${I} LUFS"; else echo "FALLA loudness ${I} LUFS (objetivo -14 ±1)"; FALLAS=$((FALLAS+1)); fi
  if awk "BEGIN{exit !($TP <= -1)}"; then echo "PASA pico ${TP} dBTP"; else echo "FALLA pico ${TP} dBTP (máx -1)"; FALLAS=$((FALLAS+1)); fi
else
  echo "AVISO sin pista de audio (válido si el sonido se agrega en la app)"
fi

NEGROS="$(ffmpeg -v info -i "$VIDEO" -vf blackdetect=d=0.3:pix_th=0.1 -an -f null - 2>&1 | grep -c black_start || true)"
if [[ "$NEGROS" == "0" ]]; then echo "PASA sin cuadros negros"; else echo "FALLA $NEGROS tramos negros"; FALLAS=$((FALLAS+1)); fi

CONGELADOS="$(ffmpeg -v info -i "$VIDEO" -vf freezedetect=n=0.003:d=1 -an -f null - 2>&1 | grep -c freeze_start || true)"
if [[ "$CONGELADOS" == "0" ]]; then echo "PASA sin congelados > 1 s"; else echo "FALLA $CONGELADOS tramos congelados"; FALLAS=$((FALLAS+1)); fi

echo "RESULTADO: $([[ $FALLAS -eq 0 ]] && echo PASA || echo "FALLA ($FALLAS)")"
