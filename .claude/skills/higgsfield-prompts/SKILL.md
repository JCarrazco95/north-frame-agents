---
name: higgsfield-prompts
description: Cómo escribir prompts de imagen y video para Higgsfield (Kling 3.0, Veo 3.1, Seedance 2.5, Soul, Motion Control, Recast) al recrear trends con Iván Torres. Úsala al escribir shotlist.json o prompts.md.
---
# Prompts para Higgsfield — North Frame

## Estructura de un prompt de video (en inglés, más preciso para los modelos)
`[sujeto + acción concreta] , [entorno] , [encuadre y lente] , [movimiento de cámara] , [luz] , [estilo/textura] , [ritmo]`

Ejemplo (clavada, Kling 3.0, i2v desde keyframe Soul ID):
"Middle-aged Mexican man in a bright orange tracksuit sprints and performs a powerful one-handed slam dunk, generic
indoor arena with orange and white crowd blurred in background, low-angle 24mm, camera tracks right then tilts up
at the jump, hard arena top light with rim light, crisp sports broadcast look, real-time speed then 0.5s slow motion
at the rim"

Negative: "logos, team crest, league branding, flags, readable text, extra fingers, deformed hands, face morphing,
duplicate person, watermark"

## Reglas
- 1 acción principal por plano; planos de 3–5 s. Más largo = más deformaciones.
- Identidad: siempre desde keyframe con Soul ID de Iván (i2v), no t2v directo, para mantener rostro.
- Vestuario: naranja de MC en todos los planos; describe la prenda igual en cada prompt.
- Público/fondo: "blurred crowd", nunca rostros en primer plano que no sean Iván.
- Sin texto en la generación: los textos se ponen en Remotion.
- 3–4 tomas por plano; cambia semilla, no el prompt, salvo corrección del revisor.

## Por modelo
| Modelo | Úsalo para | Tip |
| --- | --- | --- |
| Kling 3.0 | cuerpo, deporte, baile, manos | describe la física ("weight shifts", "feet leave the ground") |
| Veo 3.1 | luz, cámara, exteriores, audio ambiente | pide sonido ambiente explícito si lo quieres |
| Seedance 2.5 | habla, multi-shot con continuidad | guion corto, una emoción por toma |
| Motion Control | copiar el movimiento de un video de referencia | referencia limpia, una sola persona, cuerpo completo |
| Recast | reemplazar al sujeto de un clip de referencia | solo con referencias propias o con derechos; nunca sobre personas reales ajenas reconocibles |
| Soul 2.0 / Nano Banana Pro | keyframes y retoque de frames | genera el keyframe del clímax primero |

## Trends recurrentes
- **Baile**: Motion Control con la coreografía de referencia + keyframe de Iván; escenario genérico.
- **Celebración deportiva**: Kling 3.0, build-up en silencio 2 s, explosión al gesto; tribuna naranja desenfocada.
- **Stunt de acción**: Veo 3.1 para aire/nubes/luz; primer plano de reacción en Seedance; sin matrículas.
- **Llegada VIP**: cámara en mano (handheld), flashes, remate de cercanía.
