# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · **Español** · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD es una colección de flujos de trabajo para macOS diseñada para capturar tareas, organizar recordatorios y ejecutar sesiones de concentración cronometradas con las aplicaciones que ya usas.**

Basado en [Getting Things Done](https://gettingthingsdone.com/), incorpora captura mediante cuadro de diálogo, portapapeles y por lotes en Recordatorios de Apple; captura de eventos en Calendario; y comandos de tareas, notas, proyectos y concentración en Alfred. AppleScript y Automator mantienen los flujos de trabajo nativos integrados con macOS. Los adaptadores de API utilizan Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 y Google Keep v1. También se incluyen adaptadores para Things y OmniFocus. Las pruebas alojadas verifican los adaptadores de API frente a un entorno de prueba HTTPS local; la compatibilidad en vivo sigue requiriendo cuentas dedicadas de cada proveedor.

## Qué puedes hacer

- **Captura sin cambiar de aplicación.** Usa un servicio de Automator, una palabra clave de Alfred o el portapapeles para añadir una tarea. La captura por lotes crea un recordatorio por cada línea no vacía.
- **Convierte texto en tareas estructuradas.** Analiza fechas relativas e ISO, horas, prioridades, contextos y proyectos mediante el analizador AppleScript de producción compartido por la captura rápida nativa y la captura de Calendario.
- **Captura eventos y revisa tu bandeja de entrada.** Crea eventos de Calendario con hora, duración y ubicación; ejecuta una revisión semanal de cinco pasos con un volcado de ideas en Recordatorios.
- **Trabaja en sesiones de concentración cronometradas.** Inicia, inspecciona y detén sesiones entre procesos. Los temporizadores launchd propios de la sesión gestionan el vencimiento y la cancelación; los registros JSONL ofrecen análisis de duración.
- **Usa Alfred para mucho más que tareas.** Crea listas de Recordatorios para proyectos, guarda notas de referencia, abre la bandeja de entrada para revisarla, captura texto del portapapeles y edita preferencias tipadas.
- **Consulta tu bandeja de entrada desde la barra de menús.** El complemento opcional para SwiftBar/xbar muestra el recuento de elementos incompletos en la bandeja de entrada y enlaza con los flujos de captura.

El comportamiento nativo se comprueba en equipos Mac reales alojados en GitHub: las pruebas interactúan con los cuadros de diálogo de Automator y luego leen los registros creados en Recordatorios y Calendario. Consulta [pruebas y compatibilidad](#testing-and-compatibility) para conocer el alcance de esa verificación.

## Inicio rápido: Recordatorios de Apple

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Abre el flujo de trabajo en Automator y ejecútalo para probar la captura. Para que esté disponible como servicio, instala el paquete en `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Asigna un atajo en **Ajustes del Sistema → Teclado → Funciones rápidas de teclado → Servicios**. Permite el acceso de automatización a Recordatorios cuando macOS lo solicite. Introduce:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

El flujo de trabajo nativo crea un recordatorio de prioridad alta con vencimiento para mañana, lo dirige a la lista `shopping` y registra el contexto. Si no se indica un marcador de proyecto o contexto, la captura rápida usa `Inbox`.

## Sintaxis de captura

El analizador nativo de tareas y la captura de tareas de Alfred reconocen estos marcadores. Los adaptadores de proveedores cuentan con su propia compatibilidad de campos y enrutamiento.

| Entrada | Significado | Ejemplo |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Prioridad alta, media o baja | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Fecha de vencimiento relativa | `Call dentist tomorrow` |
| Día de la semana o `next weekday` | Fecha de vencimiento por día de la semana | `Send report next monday` |
| `due:YYYY-MM-DD` | Fecha de vencimiento explícita | `Renew membership due:2027-03-15` |
| Hora junto a una fecha | Hora de vencimiento | `Call Alex tomorrow at 3pm` |
| `@context` | Marcador de contexto | `Buy milk @errands` |
| `+project` | Enrutamiento a proyecto/lista | `Draft outline +website` |

También se aceptan `due:today` y `due:tomorrow`. Usa letras, números, guiones bajos o guiones en los marcadores de contexto y proyecto. La captura rápida nativa da prioridad al enrutamiento por proyecto frente al enrutamiento por contexto.

La captura de Calendario utiliza `@` para la ubicación del evento y acepta una duración en minutos o en horas:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Sin una hora o duración explícitas, la captura de Calendario usa las 9:00 AM y una hora de duración, en el primer calendario editable.

## Elige un flujo de trabajo

### Flujos de trabajo nativos de Apple

| Flujo de trabajo | Comportamiento | Paquete |
| --- | --- | --- |
| Captura rápida | Analiza el texto de la tarea y crea un recordatorio | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Captura desde portapapeles | Crea un recordatorio a partir del texto del portapapeles | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Captura por lotes | Crea recordatorios a partir de múltiples líneas | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Captura de eventos | Crea un evento en Calendario | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Revisión semanal | Revisión guiada y volcado de recordatorios | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Abre un paquete en Automator para probarlo, o instálalo en `~/Library/Services` para acceder mediante atajos de teclado. Recordatorios y Calendario necesitan los permisos de automatización correspondientes en macOS.

### Alfred

Requiere Alfred con Powerpack. Compila el paquete desde el código fuente actual:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

También puedes descargar el paquete desde [lanzamientos](https://github.com/somethingwithproof/MacGTD/releases). Los paquetes de lanzamiento reflejan el código fuente de su etiqueta; las funciones añadidas a `main` después de un lanzamiento requieren compilar desde el código fuente.

| Palabra clave | Acción |
| --- | --- |
| `task` | Captura una tarea con análisis de fecha, contexto, proyecto y prioridad |
| `note` | Guarda una nota de referencia en Recordatorios |
| `project` | Crea una lista de Recordatorios |
| `gtd process` | Abre Inbox para revisión manual |
| `clip` | Captura el texto del portapapeles |
| `gtd focus` | Inicia una sesión de concentración, consulta el estado o la detiene |
| `gtd analytics` | Inspecciona las duraciones de concentración registradas |
| `gtd preferences` | Edita las preferencias del flujo de trabajo |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Las preferencias se guardan en `~/Library/Preferences/com.alfredgtd.plist`; el estado de concentración y los registros se guardan en `~/.gtd`. Las preferencias cuentan con valores predeterminados integrados, comprobaciones de tipo, importaciones validadas y escrituras atómicas. Las sesiones de concentración no modifican los ajustes de notificaciones del sistema. El procesamiento de la bandeja de entrada abre la lista para su revisión; no mueve ni completa tareas automáticamente.

Consulta la [guía de Alfred](../../../workflows/alfred/README.md) y la [documentación de la biblioteca GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Adaptadores de captura externos

Los cuatro flujos de trabajo de captura por API se prueban mediante cuadros de diálogo reales de Automator y un entorno de prueba TLS local en las pruebas E2E alojadas. Una suite manual independiente prueba la persistencia real en los proveedores cuando se configuran cuentas dedicadas. Things y OmniFocus requieren la suite de integración de escritorio con licencia.

| Destino | Mecanismo | Configuración / fuente |
| --- | --- | --- |
| Todoist | Captura por API | [Flujo de trabajo y configuración en Llavero](../../../workflows/todoist/) |
| Notion | Captura por API de fuente de datos | [Flujo de trabajo y configuración en Llavero](../../../workflows/notion/) |
| Things 3 | Esquema de URL | [Flujo de trabajo](../../../workflows/things/) |
| OmniFocus | AppleScript / esquema de URL | [Flujo de trabajo](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Flujo de trabajo](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Flujo de trabajo](../../../workflows/google/) |

Los adaptadores de API requieren configurar credenciales; Microsoft necesita autorización OAuth delegada y Google Keep necesita acceso compatible a Workspace:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Consulta los [requisitos de configuración de API, migración y autorización](../../../workflows/api/README.md). Los identificadores de bases de datos de Notion existentes solo migran cuando se encuentra exactamente una fuente de datos. La captura de Microsoft y Google utiliza API en lugar de atajos de navegador no documentados. Los tokens de acceso OAuth requieren renovación a través de tu cliente OAuth. Las cargas útiles usan claves JSON explícitas, solicitudes HTTPS acotadas y confirmación de respuesta. Los mensajes de error conservan los detalles del fallo y ocultan el token de API configurado. Consulta [SECURITY.md](../../../SECURITY.md) para informar sobre problemas de seguridad.

### Barra de menús y Atajos

La [guía de la barra de menús](../../../workflows/menubar/README.md) cubre el complemento opcional para SwiftBar/xbar. Instala primero los servicios de Apple, luego configura el directorio de complementos en tu aplicación de barra de menús y enlaza `workflows/menubar/gtd-menubar.sh` en él.

La [guía de Atajos](../../../workflows/shortcuts/README.md) ofrece la configuración manual para la captura de texto, portapapeles y con Siri en macOS 12+. Atajos y la activación por voz con Siri quedan fuera de la suite de pruebas alojadas.

## Arquitectura

Los paquetes de Automator incrustan AppleScript para poder ejecutarse como servicios nativos. Alfred empaqueta los scripts de acción y pasa la entrada del usuario como argumentos. GTDLib expone operaciones nativas compartidas de Recordatorios desde código fuente AppleScript editable y un paquete de script compilado.

- **Un único analizador de producción:** `scripts/sync-native-parser.py` incrusta el analizador compartido en Captura rápida y Captura de eventos; la validación detecta desviaciones respecto al código fuente.
- **Estado de concentración persistente:** distintas invocaciones comparten el estado de la sesión, con trabajos launchd propios y contabilidad acotada del tiempo transcurrido.
- **Paquetes reproducibles:** el empaquetado genera un archivo limpio y las pruebas comparan su contenido con el código fuente. La biblioteca cuenta con un script de compilación independiente.
- **Pruebas observables:** los informes JUnit, los registros de comandos y los artefactos compilados probados se conservan durante 14 días en GitHub Actions.

| Directorio | Responsabilidad |
| --- | --- |
| [`workflows/`](../../../workflows/) | Paquetes nativos, adaptadores de proveedores, Alfred, Atajos y scripts de barra de menús |
| [`scripts/`](../../../scripts/) | Empaquetado, compilación de la biblioteca, sincronización del analizador y aprovisionamiento de pruebas alojadas |
| [`tests/`](../../../tests/) | Validación, comprobaciones de componentes y pruebas E2E nativas de escritorio |
| [`.github/workflows/`](../../../.github/workflows/) | CI, pruebas E2E nocturnas/manuales y mantenimiento del repositorio |
| [`infra/`](../../../infra/) | Configuración opcional de runners Mac locales y en EC2; el CI alojado no la requiere |

<a name="testing-and-compatibility"></a>

## Pruebas y compatibilidad

| Alcance | Entorno | Qué se comprueba |
| --- | --- | --- |
| Validación | macOS 15 y 26 alojados en GitHub | Compilación de AppleScript, paquetes, analizador de producción, destinos de acción, preferencias, estado de concentración, transporte de API de prueba y verificación de integridad de paquetes |
| Comprobaciones de seguridad | Ubuntu y macOS 15 alojados en GitHub | Python CodeQL, ShellCheck y fuzzing acotado con Atheris del analizador de producción compilado |
| E2E de adaptadores de proveedores | `macos-15-intel` alojado en GitHub | Los cuatro cuadros de diálogo de API de producción, transporte TLS, persistencia/lectura en entorno de prueba, fallos de API, cancelación y selección de fuente en Notion |
| E2E con proveedores en vivo | Ejecución manual en Mac alojado en GitHub con secretos dedicados | Captura real en Todoist, Notion, Microsoft y Google con lectura de comprobación en el proveedor; falla si faltan las cuentas |
| Integraciones de escritorio con licencia | Cuenta local dedicada | Invocación desde la interfaz y persistencia en Things 3, OmniFocus 4 y Alfred |
| E2E de escritorio nativo | `macos-15-intel` alojado en GitHub | Cuadros de diálogo reales de Automator; datos persistidos en Recordatorios y Calendario; revisión semanal; recuentos del menú; GTDLib compilado; acciones nativas empaquetadas de Alfred; vencimiento y cancelación reales de temporizadores launchd |
| Interfaz opcional de Alfred | Cuenta local dedicada, Alfred 5 + Powerpack | Importación del flujo de trabajo, invocación por palabra clave y lectura de recordatorios mediante la interfaz con licencia |

La [ejecución verificada de modernización de API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) superó **35 pruebas de validación en cada plataforma de validación y 26 pruebas E2E de escritorio**, sin fallos, errores ni omisiones. La cobertura de escritorio incluye 15 pruebas nativas y 11 pruebas de adaptadores de proveedores, incluidas comprobaciones reales de tiempo de espera de transporte y de Llavero transitorio. La validación también ejecuta comprobaciones de estructura del repositorio. Estos resultados cubren el comportamiento nativo y los entornos de prueba de proveedores; no demuestran la compatibilidad con proveedores en vivo ni con aplicaciones con licencia. El estado actual se muestra en las insignias superiores.

Las solicitudes de extracción y los envíos a `main` ejecutan la validación seguida de las pruebas E2E nativas. El flujo de trabajo E2E también se ejecuta cada noche y bajo demanda manual, incluyendo pruebas deterministas de adaptadores de proveedores. Las pruebas con proveedores en vivo usan el flujo de trabajo manual independiente `live-e2e.yml`. La integración continua predeterminada utiliza equipos Mac desechables alojados en GitHub, entornos de prueba aislados y subprocesos acotados; no se requiere ningún runner autoalojado ni credenciales de cuentas externas para la suite predeterminada. La suite manual en vivo requiere secretos dedicados de cada proveedor.

Las versiones anteriores de macOS no están validadas por la integración continua actual. Las ejecuciones con proveedores en vivo requieren secretos dedicados y aún no se han verificado. Atajos/Siri y las aplicaciones de escritorio con licencia quedan fuera de la suite alojada predeterminada. Las pruebas de acciones nativas ejercitan directamente los scripts empaquetados de Alfred; no demuestran la compatibilidad completa con la interfaz de Alfred. Consulta [configuración de pruebas, requisitos previos y cobertura](../../../tests/e2e/README.md).

## Localización

Las cadenas visibles para el usuario de la CLI, del ejecutor de pruebas y de la barra de menús se distribuyen en 45 configuraciones regionales (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) en `locales/` mediante `scripts/i18n.py`, sin dependencias de terceros. La resolución de la configuración regional comprueba `--lang`, luego `LC_ALL`, `LC_MESSAGES` y `LANG`, usando `en` como respaldo.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Desarrollo

Instala [mise](https://mise.jdx.dev/) y utiliza la versión de Python fijada en `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

La validación guarda los informes en `test-results/`; los scripts de compilación escriben en `dist/`. Para ejecutar la suite de escritorio alojada en `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Las pruebas E2E de escritorio locales requieren una cuenta de prueba dedicada con sesión iniciada y los permisos descritos en la [guía E2E](../../../tests/e2e/README.md). El script de aprovisionamiento de permisos alojado está restringido a trabajos desechables alojados en GitHub.

Usa [Conventional Commits](https://www.conventionalcommits.org/) y sigue [CONTRIBUTING.md](../../../CONTRIBUTING.md). Los cambios recientes están registrados en [CHANGELOG.md](../../../CHANGELOG.md).

Los controles de seguridad, la verificación de firmas de lanzamiento y las limitaciones
restantes de Scorecard están documentados en la [evaluación de seguridad](../../../docs/security-assessment.md).
El flujo de trabajo de lanzamiento compila y certifica los paquetes antes de crear un borrador de lanzamiento,
incluyendo procedencia in-toto firmada y paquetes Sigstore verificados frente al
commit y la referencia de origen. La nueva procedencia se aplica a esas compilaciones del flujo de trabajo, no
a descargas anteriores.

## Historia del proyecto y licencia

MacGTD consolida los antiguos repositorios MacGTD-Native, MacGTD-Microsoft, MacGTD-Google y AlfredGTD. Se distribuye bajo la [licencia MIT](../../../LICENSE).
