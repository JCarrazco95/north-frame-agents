---
description: Sincroniza la sesión con el equipo (git + monday) y muestra qué está libre. Correr al iniciar.
---
1. Ejecuta `git pull --rebase`. Si hay conflictos, detente y explícalos.
2. Identifica a la persona de esta sesión con `git config user.email` (su usuario de monday es ese correo).
3. Lanza en paralelo:
   - `monday-sync` → Resumen.
   - Lectura de `docs/contexto/candidato.md` para ver qué sigue [PENDIENTE].
4. Muestra en máximo 25 líneas:
   - Piezas en curso y quién las tiene.
   - Piezas libres listas para avanzar, ordenadas por Prioridad y "Publicar el".
   - Trends del Radar por caducar en los próximos 5 días.
   - Pendientes del cliente que bloquean producción.
5. Pregunta qué pieza toma esta persona (o sugiere la más urgente libre).
