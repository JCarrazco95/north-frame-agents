---
description: Cierra la sesión dejando el estado listo para la otra persona. Correr siempre al terminar.
---
1. Para cada pieza que tomó esta persona: `monday-sync` → update con avance y siguiente paso; si no la va a seguir hoy,
   Soltar pieza.
2. `monday-sync` → Bitácora de sesión (fecha, persona, piezas, decisiones, pendientes).
3. Si en la sesión se decidió algo que cambia el contexto (personaje, reglas, estilo), propón el cambio a
   `docs/contexto/` en una rama `contexto/<tema>` y abre PR para la otra persona.
4. `git add piezas docs && git commit -m "sesión <fecha> <persona>" && git push` (solo texto; media/ no se versiona).
5. Muestra un resumen de 5 líneas.
