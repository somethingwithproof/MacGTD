# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · **Italiano** · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD è una raccolta di flussi di lavoro per macOS pensata per acquisire attività, organizzare promemoria e avviare sessioni di concentrazione a tempo con le app che usi già.**

Basato su [Getting Things Done](https://gettingthingsdone.com/), porta l'acquisizione tramite finestra di dialogo, appunti e in blocco su Apple Promemoria, l'acquisizione di eventi su Calendario e comandi per attività, note, progetti e sessioni di concentrazione su Alfred. AppleScript e Automator mantengono i flussi di lavoro nativi strettamente integrati con macOS. Gli adattatori API utilizzano Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 e Google Keep v1. Sono inclusi anche adattatori per Things e OmniFocus. I test su runner ospitati verificano gli adattatori API rispetto a una fixture HTTPS locale; la compatibilità con i servizi reali richiede comunque account dedicati presso i rispettivi provider.

## Cosa puoi fare

- **Acquisire senza cambiare app.** Usa un Servizio di Automator, una parola chiave di Alfred o gli appunti per aggiungere un'attività. L'acquisizione in blocco crea un promemoria per ogni riga non vuota.
- **Trasformare il testo in attività strutturate.** Analizza date relative e ISO, orari, priorità, contesti e progetti utilizzando il parser AppleScript di produzione condiviso dall'acquisizione rapida nativa e dall'acquisizione in Calendario.
- **Acquisire eventi e rivedere la tua Inbox.** Crea eventi in Calendario con orario, durata e luogo; esegui una revisione settimanale in cinque passaggi con un brain dump in Promemoria.
- **Lavorare in sessioni di concentrazione a tempo.** Avvia, ispeziona e interrompi sessioni tra processi diversi. Timer launchd associati alla sessione gestiscono la scadenza e l'annullamento; i log JSONL forniscono statistiche sulla durata.
- **Usare Alfred non solo per le attività.** Crea elenchi di Promemoria per i progetti, salva note di riferimento, apri la Inbox per la revisione, acquisisci il testo dagli appunti e modifica le preferenze tipizzate.
- **Visualizzare la Inbox dalla barra dei menu.** Il plugin opzionale per SwiftBar/xbar mostra il conteggio degli elementi incompleti nella Inbox e offre collegamenti ai flussi di lavoro di acquisizione.

Il comportamento nativo viene verificato su veri Mac ospitati su GitHub: i test interagiscono con le finestre di dialogo di Automator, quindi rileggono i record salvati in Promemoria e Calendario. Consulta [test e compatibilità](#test-e-compatibilità) per conoscere l'ambito di queste verifiche.

## Avvio rapido: Apple Promemoria

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Apri il flusso di lavoro in Automator ed eseguilo per provare l'acquisizione. Per renderlo disponibile come Servizio, installa il bundle in `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Assegna una scorciatoia in **Impostazioni di Sistema → Tastiera → Abbreviazioni da tastiera → Servizi**. Consenti l'accesso di Automazione a Promemoria quando macOS lo richiede. Inserisci:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Il flusso di lavoro nativo crea un promemoria ad alta priorità con scadenza domani, lo instrada nell'elenco `shopping` e registra il contesto. Senza un marcatore di progetto o contesto, l'acquisizione rapida utilizza `Inbox`.

## Sintassi di acquisizione

Il parser nativo delle attività e l'acquisizione attività di Alfred riconoscono questi marcatori. Gli adattatori dei provider dispongono di un proprio supporto per campi e instradamento.

| Input | Significato | Esempio |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Priorità alta, media o bassa | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Scadenza relativa | `Call dentist tomorrow` |
| Giorno della settimana o `next weekday` | Scadenza al giorno della settimana | `Send report next monday` |
| `due:YYYY-MM-DD` | Data di scadenza esplicita | `Renew membership due:2027-03-15` |
| Orario insieme a una data | Ora di scadenza | `Call Alex tomorrow at 3pm` |
| `@context` | Marcatore di contesto | `Buy milk @errands` |
| `+project` | Instradamento a progetto/elenco | `Draft outline +website` |

Sono accettati anche `due:today` e `due:tomorrow`. Usa lettere, numeri, trattini bassi o trattini nei marcatori di contesto e progetto. L'acquisizione rapida nativa dà priorità all'instradamento per progetto rispetto a quello per contesto.

L'acquisizione in Calendario usa `@` per il luogo dell'evento e accetta una durata in minuti o ore:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Senza un orario o una durata espliciti, l'acquisizione in Calendario utilizza le 9:00 e un'ora di durata, nel primo calendario scrivibile.

## Scegli un flusso di lavoro

### Flussi di lavoro nativi Apple

| Flusso di lavoro | Comportamento | Bundle |
| --- | --- | --- |
| Acquisizione rapida | Analizza il testo dell'attività e crea un promemoria | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Acquisizione da appunti | Crea un promemoria dal testo negli appunti | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Acquisizione in blocco | Crea promemoria da più righe | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Acquisizione evento | Crea un evento in Calendario | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Revisione settimanale | Revisione guidata e brain dump nei promemoria | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Apri un bundle in Automator per provarlo oppure installalo in `~/Library/Services` per accedervi da tastiera. Promemoria e Calendario richiedono le opportune autorizzazioni di Automazione su macOS.

### Alfred

Richiede Alfred con Powerpack. Compila il pacchetto dal sorgente attuale:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Puoi anche scaricare il pacchetto dalle [release](https://github.com/somethingwithproof/MacGTD/releases). I pacchetti delle release riflettono il codice sorgente al momento del tag; le funzionalità aggiunte a `main` dopo una release richiedono una compilazione dai sorgenti.

| Parola chiave | Azione |
| --- | --- |
| `task` | Acquisisce un'attività con analisi di data, contesto, progetto e priorità |
| `note` | Salva una nota di riferimento in Promemoria |
| `project` | Crea un elenco in Promemoria |
| `gtd process` | Apre la Inbox per la revisione manuale |
| `clip` | Acquisisce il testo dagli appunti |
| `gtd focus` | Avvia una sessione di concentrazione, ne verifica lo stato o la interrompe |
| `gtd analytics` | Ispeziona le durate registrate delle sessioni di concentrazione |
| `gtd preferences` | Modifica le preferenze del flusso di lavoro |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Le preferenze si trovano in `~/Library/Preferences/com.alfredgtd.plist`; lo stato e i log delle sessioni di concentrazione si trovano in `~/.gtd`. Le preferenze dispongono di valori predefiniti integrati, controlli sui tipi, importazioni validate e scritture atomiche. Le sessioni di concentrazione non modificano le impostazioni delle notifiche di sistema. L'elaborazione della Inbox apre l'elenco per la revisione; non sposta né completa automaticamente le attività.

Consulta la [guida di Alfred](../../../workflows/alfred/README.md) e la [documentazione della libreria GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Adattatori di acquisizione esterni

Tutti e quattro i flussi di lavoro di acquisizione tramite API vengono esercitati mediante vere finestre di dialogo di Automator e una fixture TLS locale nei test E2E ospitati. Una suite manuale separata verifica la persistenza reale presso i vendor quando sono configurati account dedicati. Things e OmniFocus richiedono la suite di integrazione desktop con licenza.

| Destinazione | Meccanismo | Configurazione / sorgente |
| --- | --- | --- |
| Todoist | Acquisizione tramite API | [Flusso di lavoro e configurazione Portachiavi](../../../workflows/todoist/) |
| Notion | Acquisizione tramite API data source | [Flusso di lavoro e configurazione Portachiavi](../../../workflows/notion/) |
| Things 3 | Schema URL | [Flusso di lavoro](../../../workflows/things/) |
| OmniFocus | AppleScript / Schema URL | [Flusso di lavoro](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Flusso di lavoro](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Flusso di lavoro](../../../workflows/google/) |

Gli adattatori API richiedono la configurazione delle credenziali; Microsoft richiede l'autorizzazione OAuth delegata e Google Keep richiede un accesso Workspace idoneo:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Consulta [configurazione API, migrazione e requisiti di autorizzazione](../../../workflows/api/README.md). Gli ID dei database Notion esistenti vengono migrati solo quando viene trovata esattamente una sorgente dati. L'acquisizione con Microsoft e Google utilizza le API invece di scorciatoie browser non documentate. I token di accesso OAuth richiedono il rinnovo tramite il proprio client OAuth. I payload utilizzano chiavi JSON esplicite, richieste HTTPS limitate e conferma della risposta. I messaggi di errore conservano i dettagli dell'errore oscurando al contempo il token API configurato. Consulta [SECURITY.md](../../../SECURITY.md) per segnalare problemi di sicurezza.

### Barra dei menu e Comandi Rapidi

La [guida alla barra dei menu](../../../workflows/menubar/README.md) descrive il plugin opzionale per SwiftBar/xbar. Installa prima i Servizi Apple, poi configura la directory dei plugin nella tua app per la barra dei menu e collegavi `workflows/menubar/gtd-menubar.sh`.

La [guida a Comandi Rapidi](../../../workflows/shortcuts/README.md) fornisce la configurazione manuale per l'acquisizione tramite testo, appunti e Siri su macOS 12+. Comandi Rapidi e l'attivazione vocale con Siri sono esclusi dalla suite di test ospitata.

## Architettura

I bundle di Automator incorporano AppleScript in modo da poter essere eseguiti come Servizi nativi. Alfred impacchetta gli script delle azioni e passa l'input dell'utente come argomenti. GTDLib espone operazioni native condivise per Promemoria a partire da codice sorgente AppleScript modificabile e da un bundle di script compilato.

- **Un unico parser di produzione:** `scripts/sync-native-parser.py` incorpora il parser condiviso in Quick Capture ed Event Capture; la validazione rileva eventuali disallineamenti rispetto ai sorgenti.
- **Stato persistente delle sessioni di concentrazione:** esecuzioni separate condividono lo stato della sessione, con job launchd dedicati e conteggio limitato del tempo trascorso.
- **Pacchetti riproducibili:** il packaging crea un nuovo archivio e i test ne confrontano il contenuto con i sorgenti. La libreria ha uno script di compilazione separato.
- **Test osservabili:** i report JUnit, i log dei comandi e gli artefatti di build testati vengono conservati per 14 giorni in GitHub Actions.

| Directory | Responsabilità |
| --- | --- |
| [`workflows/`](../../../workflows/) | Bundle nativi, adattatori per provider, Alfred, Comandi Rapidi e script per la barra dei menu |
| [`scripts/`](../../../scripts/) | Packaging, compilazione della libreria, sincronizzazione del parser e provisioning dei test ospitati |
| [`tests/`](../../../tests/) | Validazione, verifiche dei componenti e test E2E desktop nativi |
| [`.github/workflows/`](../../../.github/workflows/) | CI, test E2E notturni/manuali e manutenzione del repository |
| [`infra/`](../../../infra/) | Configurazione opzionale per runner Mac locali ed EC2; la CI ospitata non la richiede |

## Test e compatibilità

| Ambito | Ambiente | Cosa viene verificato |
| --- | --- | --- |
| Validazione | macOS 15 e 26 ospitati su GitHub | Compilazione AppleScript, bundle, parser di produzione, target delle azioni, preferenze, stato di concentrazione, trasporto API su fixture e round-trip dei pacchetti |
| Verifiche di sicurezza | Ubuntu e macOS 15 ospitati su GitHub | CodeQL per Python, ShellCheck e fuzzing Atheris limitato del parser di produzione compilato |
| E2E adattatori provider | `macos-15-intel` ospitato su GitHub | Tutte e quattro le finestre di dialogo API di produzione, trasporto TLS, persistenza/rilettura su fixture, errori API, annullamento e selezione della sorgente Notion |
| E2E provider reali | Esecuzione manuale su Mac ospitato su GitHub con segreti dedicati | Acquisizione reale e rilettura su Todoist, Notion, Microsoft e Google; fallisce se mancano gli account |
| Integrazioni desktop con licenza | Account locale dedicato | Invocazione tramite UI e persistenza per Things 3, OmniFocus 4 e Alfred |
| E2E desktop nativi | `macos-15-intel` ospitato su GitHub | Vere finestre di dialogo di Automator; dati persistenti in Promemoria e Calendario; revisione settimanale; conteggi del menu; GTDLib compilata; azioni native di Alfred impacchettate; scadenza e annullamento di veri timer launchd |
| UI di Alfred opzionale | Account locale dedicato, Alfred 5 + Powerpack | Importazione del flusso di lavoro, invocazione tramite parola chiave e rilettura dei promemoria tramite la UI con licenza |

La [verifica dell'esecuzione di modernizzazione API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) ha superato **35 test di validazione su ciascuna piattaforma di validazione e 26 test E2E desktop**, senza fallimenti, errori o test saltati. La copertura desktop include 15 test nativi e 11 test degli adattatori provider, compresi verifiche effettive di timeout del trasporto e controlli transitori sul Portachiavi. La validazione esegue inoltre verifiche sulla struttura del repository. Questi risultati coprono il comportamento nativo e le fixture dei provider; non stabiliscono la compatibilità con i provider reali o con le app con licenza. Lo stato attuale è mostrato dai badge qui sopra.

Le pull request e i push su `main` eseguono la validazione seguita dai test E2E nativi. Il workflow E2E viene inoltre eseguito ogni notte e su avvio manuale, includendo i test deterministici sugli adattatori provider. I test sui provider reali utilizzano il workflow manuale separato `live-e2e.yml`. La CI predefinita utilizza Mac effimeri ospitati su GitHub, fixture isolate e sottoprocessi limitati; per la suite predefinita non sono necessari runner self-hosted né credenziali di account esterni. La suite manuale su provider reali richiede segreti dedicati per i provider.

Le versioni precedenti di macOS non sono validate dalla CI attuale. Le esecuzioni su provider reali richiedono segreti dedicati e non sono ancora state verificate. Comandi Rapidi/Siri e le app desktop con licenza sono esclusi dalla suite ospitata predefinita. I test delle azioni native esercitano direttamente gli script Alfred impacchettati; non dimostrano la piena compatibilità con l'interfaccia utente di Alfred. Consulta [configurazione dei test, prerequisiti e copertura](../../../tests/e2e/README.md).

## Localizzazione

Le stringhe rivolte all'utente di CLI, test runner e barra dei menu sono disponibili in 45 lingue (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) in `locales/` tramite `scripts/i18n.py`, senza alcuna dipendenza di terze parti. La risoluzione della lingua controlla `--lang`, poi `LC_ALL`, `LC_MESSAGES` e `LANG`, ripiegando su `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Sviluppo

Installa [mise](https://mise.jdx.dev/) e usa la versione di Python fissata in `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

La validazione salva i report in `test-results/`; gli script di build scrivono in `dist/`. Per eseguire la suite desktop ospitata su `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

I test E2E desktop locali richiedono un account di test dedicato con sessione attiva e le autorizzazioni descritte nella [guida E2E](../../../tests/e2e/README.md). Lo script ospitato per il provisioning delle autorizzazioni è limitato ai job effimeri ospitati su GitHub.

Usa [Conventional Commits](https://www.conventionalcommits.org/) e segui [CONTRIBUTING.md](../../../CONTRIBUTING.md). Le modifiche recenti sono annotate in [CHANGELOG.md](../../../CHANGELOG.md).

I controlli di sicurezza, la verifica della firma delle release e le restanti limitazioni di Scorecard sono documentati nella [valutazione di sicurezza](../../../docs/security-assessment.md).
Il workflow di release compila e attesta i pacchetti prima di creare una bozza di release,
includendo provenienza in-toto firmata e bundle Sigstore verificati rispetto al
commit e al ref sorgente. La nuova provenienza si applica a quelle build del workflow, non
ai download precedenti.

## Cronologia del progetto e licenza

MacGTD unifica i precedenti repository MacGTD-Native, MacGTD-Microsoft, MacGTD-Google e AlfredGTD. È distribuito con [Licenza MIT](../../../LICENSE).
