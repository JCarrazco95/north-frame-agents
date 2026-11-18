---
description: Registra y analiza un trend nuevo (link o archivo). Uso /nuevo-trend <link o ruta a video>
argument-hint: <link o ruta>
---
Trend: $ARGUMENTS

1. Lanza `trend-scout` para registrarlo en el Radar (o encontrar el item si ya existe). Obtén el item ID.
2. Si es un archivo local, cópialo a `media/radar-<item>/referencia.mp4`. Si es un link, pide al humano que lo
   descargue ahí (no descargues de redes sociales con scripts).
3. Crea la carpeta con `bash scripts/nueva_pieza.sh radar-<item> <slug>`.
4. Lanza en paralelo `trend-analyst` y `estratega-psicologico` (este último espera `analisis.md`; si aún no existe,
   lánzalo cuando termine el análisis).
5. Muestra Score, Fit, Riesgo y los 3 conceptos. Pregunta si se aprueba para producir (Estado = Aprobado) y cuál concepto.
