# North Frame — agentes de producción de trends

Repositorio compartido por el equipo (2 personas). Contiene **los mismos agentes y el mismo contexto** para todos.
El estado del trabajo vive en monday (workspace North Frame). Los videos viven en una carpeta compartida, no en git.

## Instalación (cada persona, una vez)
1. Requisitos: Claude Code, Node 20+, git, ffmpeg.
2. Clonar: `git clone https://github.com/JCarrazco95/north-frame-agents.git && cd north-frame-agents`
3. Tu correo de git debe ser el de tu usuario de monday: `git config user.email tu@correo.com`
4. `cp .env.example .env` y pon en `NF_MEDIA_DIR` la ruta local de la carpeta compartida de media.
   Luego enlázala: `ln -s "$NF_MEDIA_DIR" media` (Windows: `mklink /D media <ruta>`).
5. Abre `claude` en la carpeta. La primera vez autoriza los MCP de **monday** y **Higgsfield** (OAuth, con la cuenta del equipo).
6. Corre `/sync`.

## Uso diario
| Comando | Para qué |
| --- | --- |
| `/sync` | Al empezar: git pull + resumen de monday + qué está libre |
| `/estado` | Ver el tablero sin tomar nada |
| `/nuevo-trend <link o archivo>` | Registrar y analizar un trend |
| `/producir <item>` | Avanzar una pieza hasta la siguiente compuerta |
| `/revisar <item> <1\|2\|3>` | Correr una compuerta Opus |
| `/cerrar-sesion` | Al terminar: monday + bitácora + git push |

## Cómo no pisarse
- Candado: columna **Tomado por** en Producción. Nadie toca una pieza tomada por otro.
- Cada pieza tiene su carpeta `piezas/<item>-<slug>/`; dos personas nunca escriben la misma carpeta.
- Cambios a agentes, comandos, `CLAUDE.md` o `docs/contexto/`: rama + PR que revisa la otra persona.

## Estructura
```
CLAUDE.md                 instrucciones del orquestador (Opus)
.claude/agents/           14 subagentes (Opus / Sonnet / Haiku)
.claude/commands/         /sync /estado /nuevo-trend /producir /revisar /cerrar-sesion
.claude/skills/           higgsfield-prompts
docs/contexto/            candidato, psicología de trends, reglas electorales, biblioteca base
docs/monday.md            IDs de tableros y columnas
scripts/                  analizar_video.sh, qa_video.sh, nueva_pieza.sh
piezas/                   texto de cada pieza (versionado)
media/                    videos (carpeta compartida, ignorada por git)
remotion/                 plantilla de marca (por inicializar)
comfy/workflows/          workflows de la ruta local
```
