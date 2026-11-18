---
description: Corre una compuerta de revisión Opus sobre una pieza. Uso /revisar <item_id> <1|2|3>
argument-hint: <item_id> <compuerta>
---
Argumentos: $ARGUMENTS

1. Si la compuerta es 2 o 3, lanza primero `qa-tecnico` para generar hojas de frames y el reporte técnico.
2. Lanza `revisor-opus` con la compuerta indicada y las rutas de la pieza.
3. Escribe el veredicto en "Último veredicto Opus" y como update vía `monday-sync`. Cambia Etapa a la siguiente o a "Corregir".
