# Mapa de monday — North Frame

Workspace: **North Frame** `18543144` — https://analysys-company.monday.com/workspaces/18543144

Los agentes usan el MCP de monday (`.mcp.json`). Siempre escribe valores con estos IDs de columna.
Si un ID falla, corre `get_board_info` del tablero y actualiza este archivo con un PR.

## 1. Radar de Trends — `18440487594`
Grupos: `topics` = Bandeja (nuevos trends) · `group_mm978hpe` = Biblioteca base: formatos ya producidos

| Columna | ID | Tipo | Valores |
| --- | --- | --- | --- |
| Estado | `color_mm97g06w` | status | Nuevo, Analizando, Aprobado, Producido, Descartado |
| Arquetipo | `dropdown_mm973eed` | dropdown | Baile, Celebración deportiva, Llegada de celebridad, Stunt de acción, Hazaña deportiva, Audio/meme, POV, Transformación, Otro |
| Palanca psicológica | `dropdown_mm979ryb` | dropdown | Interrupción de patrón, Incongruencia/humor, Identidad local, Prueba social, Estatus/aspiración, Asombro, Curiosidad, Simpatía/cercanía, Nostalgia |
| Plataforma | `dropdown_mm97z89` | dropdown | TikTok, Instagram Reels, YouTube Shorts, Facebook, X |
| Riesgo | `color_mm978jn1` | status | Bajo, Medio, Alto |
| Link referencia | `link_mm97q10f` | link | |
| Score viralidad | `numeric_mm977zh8` | numbers | 0–10 |
| Fit candidato | `numeric_mm97c4de` | numbers | 0–10 |
| Caduca | `date_mm97mn6` | date | |
| Ficha del trend | `long_text_mm9783ng` | long_text | |
| Responsable | `multiple_person_mm972nrv` | people | |

Items base (Biblioteca): baile `13577712966` · estadio `13577698972` · llegada VIP `13577707577` ·
helicóptero `13577707576` · clavada `13577706901`

## 2. Producción de piezas — `18440487672`
Grupos: `topics` = En producción · `group_mm975qcp` = Backlog · `group_mm9715s` = Publicadas

| Columna | ID | Tipo | Valores |
| --- | --- | --- | --- |
| Etapa | `color_mm97yjt5` | status | Brief, Análisis y concepto, Guion, Compuerta 1 (Opus), Prompts y storyboard, Generando, Compuerta 2 (Opus), Edición Remotion, Cumplimiento, Compuerta 3 (Opus), Aprobación cliente, Programado, Publicado, Corregir, Bloqueado |
| Tomado por | `multiple_person_mm97hmab` | people | candado de sesión |
| Agente en curso | `text_mm973qyk` | text | |
| Trend origen | `board_relation_mm97fn2f` | board_relation → Radar | |
| Formatos | `dropdown_mm978kz` | dropdown | 9:16, 1:1, 4:5, 16:9 |
| Prioridad | `color_mm97c813` | status | Urgente (trend caduca), Alta, Normal |
| Publicar el | `date_mm97watp` | date | |
| Créditos usados | `numeric_mm9756bx` | numbers | |
| Carpeta de la pieza | `link_mm9718vs` | link | carpeta compartida de media |
| Etiqueta IA puesta | `boolean_mm97cx53` | checkbox | |
| Último veredicto Opus | `long_text_mm974pnz` | long_text | |
| Concepto | `long_text_mm97sm6k` | long_text | |

## 3. Bitácora IA y assets — `18440487675`
Grupo: `topics` = Generaciones

| Columna | ID | Tipo | Valores |
| --- | --- | --- | --- |
| Pieza | `board_relation_mm97cvfv` | board_relation → Producción | |
| Modelo | `dropdown_mm97fqry` | dropdown | Kling 3.0, Veo 3.1, Seedance 2.5, Sora 2, Cinema Studio, Soul 2.0, Nano Banana Pro, Recast, Motion Control, Speak, Wan 2.2 local, LTX-2.3 local, ElevenLabs, Chatterbox local, Suno, Otro |
| Tipo | `dropdown_mm97bfh5` | dropdown | Imagen, Video, Voz, Música, Lip-sync, Upscale |
| Prompt | `long_text_mm97nfxz` | long_text | |
| Créditos | `numeric_mm972m9` | numbers | |
| Archivo | `link_mm97mn4r` | link | |
| Resultado | `color_mm9795s6` | status | Seleccionado, Descartado, Rechazado en QA |
| Job ID | `text_mm97xk61` | text | |
| Creado | `pulse_log_mm97r5cc` | creation_log | |

## 4. Publicación y métricas — `18440487683`
Grupo: `topics` = Publicaciones

| Columna | ID | Tipo |
| --- | --- | --- |
| Pieza | `board_relation_mm97ef15` | board_relation → Producción |
| Red | `dropdown_mm97e496` | dropdown (TikTok, Instagram, Facebook, YouTube Shorts, X) |
| Publicado el | `date_mm97xbfp` | date |
| Link post | `link_mm9730gk` | link |
| Vistas 24 h | `numeric_mm97qrb6` | numbers |
| Vistas 7 d | `numeric_mm97wsvn` | numbers |
| Retención 3 s (%) | `numeric_mm97t605` | numbers |
| Compartidos | `numeric_mm97a84z` | numbers |
| Comentarios | `numeric_mm97e3jt` | numbers |
| Aprendizaje | `long_text_mm97d16w` | long_text |

## Docs de monday
- Contexto maestro y Bitácora de sesiones: en el workspace (ver IDs en `docs/monday-docs.md`).

## Reglas de escritura
- Cada cambio de etapa va acompañado de un **update** en el item con: qué se hizo, qué agente, archivos, siguiente paso.
- Valores de status y dropdown: usa exactamente los textos de arriba.
- Nunca borres items. Para descartar, cambia el estado.
