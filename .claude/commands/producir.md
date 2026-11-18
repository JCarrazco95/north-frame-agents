---
description: Crea o avanza una pieza en Producción desde su etapa actual hasta la siguiente compuerta. Uso /producir <item de Radar o de Producción>
argument-hint: <item_id>
---
Item: $ARGUMENTS

1. `monday-sync` → Tomar pieza. Si responde OCUPADA, detente.
   - Si el ID es de Radar: crea primero el item en Producción (grupo En producción, Etapa = Brief, Trend origen = ese
     item, Formatos = 9:16) y escribe `piezas/<item>-<slug>/brief.md` con el concepto aprobado.
2. Lee la Etapa actual y ejecuta el tramo del pipeline de `CLAUDE.md` hasta la siguiente compuerta, lanzando en paralelo
   los agentes de cada etapa que no dependan entre sí.
3. Después de cada etapa: `monday-sync` → Cambio de etapa.
4. En cada compuerta lanza `revisor-opus`. Si CORREGIR, regresa a la etapa indicada (máx. 2 vueltas).
5. Al llegar a "Aprobación cliente", detente: prepara un resumen de 5 líneas + rutas de render y portada para que el
   humano lo mande al equipo del candidato.
6. Commit de los archivos de texto de la pieza: `git add piezas/<item>* && git commit -m "pieza <item>: <etapa>" && git push`.
