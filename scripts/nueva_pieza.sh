#!/usr/bin/env bash
# Crea las carpetas de una pieza. Uso: bash scripts/nueva_pieza.sh <item_id> <slug>
set -euo pipefail
ID="${1:?Falta item_id}"
SLUG="${2:?Falta slug}"
P="piezas/${ID}-${SLUG}"
M="media/${ID}-${SLUG}"
mkdir -p "$P/analisis" "$M/render"
[[ -f "$P/brief.md" ]] || printf '# Brief %s\n\n- Trend origen:\n- Concepto aprobado:\n- Publicar el:\n- Formatos: 9:16\n' "$ID" > "$P/brief.md"
echo "$P"
echo "$M"
