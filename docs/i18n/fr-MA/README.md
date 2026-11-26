# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · **Français (Maroc)** · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD est une collection de workflows macOS pour capturer vos tâches, organiser vos rappels et lancer des sessions de concentration chronométrées avec les applications que vous utilisez déjà.**

Conçu autour de la méthode [Getting Things Done](https://gettingthingsdone.com/), il apporte la capture par boîte de dialogue, depuis le presse-papiers et par lot dans Apple Reminders ; la capture d'événements dans Calendrier ; ainsi que des commandes de tâches, de notes, de projets et de concentration dans Alfred. AppleScript et Automator gardent les workflows natifs au plus près de macOS. Les adaptateurs API utilisent Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 et Google Keep v1. Des adaptateurs pour Things et OmniFocus sont également inclus. Les tests hébergés vérifient les adaptateurs API à l'aide d'une fixture HTTPS locale ; la compatibilité en conditions réelles nécessite toujours des comptes dédiés chez les fournisseurs.

## Ce que vous pouvez faire

- **Capturer sans changer d'application.** Utilisez un service Automator, un mot-clé Alfred ou le presse-papiers pour ajouter une tâche. La capture par lot crée un rappel par ligne non vide.
- **Transformer du texte en tâches structurées.** Analysez les dates relatives et ISO, les heures, les priorités, les contextes et les projets grâce au parseur AppleScript de production, partagé entre la capture rapide native et la capture Calendrier.
- **Capturer des événements et passer en revue votre boîte de réception.** Créez des événements Calendrier avec une heure, une durée et un lieu ; effectuez une revue hebdomadaire en cinq étapes accompagnée d'un vidage d'esprit vers Rappels.
- **Travailler par sessions de concentration chronométrées.** Démarrez, consultez et arrêtez des sessions entre différents processus. Des minuteurs launchd propres à chaque session gèrent l'expiration et l'annulation ; les logs JSONL fournissent des statistiques de durée.
- **Utiliser Alfred pour bien plus que des tâches.** Créez des listes Rappels pour vos projets, enregistrez des notes de référence, ouvrez la boîte de réception pour la revue, capturez le texte du presse-papiers et modifiez des préférences typées.
- **Consulter votre boîte de réception depuis la barre des menus.** Le plugin optionnel SwiftBar/xbar affiche le nombre d'éléments incomplets dans la boîte de réception et donne un accès direct aux workflows de capture.

Le comportement natif est vérifié sur de vrais Mac hébergés par GitHub : les tests pilotent des boîtes de dialogue Automator, puis relisent les entrées créées dans Rappels et Calendrier. Consultez la section [tests et compatibilité](#testing-and-compatibility) pour connaître la portée de ces vérifications.

## Démarrage rapide : Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Ouvrez le workflow dans Automator et exécutez-le pour essayer la capture. Pour le rendre disponible en tant que service, installez le bundle dans `~/Library/Services` :

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Attribuez un raccourci dans **Réglages Système → Clavier → Raccourcis clavier → Services**. Autorisez l'accès Automatisation à Rappels lorsque macOS le demande. Saisissez :

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Le workflow natif crée un rappel de priorité élevée pour demain, l'oriente vers la liste `shopping` et enregistre le contexte. Sans marqueur de projet ou de contexte, la capture rapide utilise `Inbox`.

## Syntaxe de capture

Le parseur de tâches natif et la capture de tâches Alfred reconnaissent les marqueurs suivants. Les adaptateurs de fournisseurs disposent de leur propre gestion des champs et du routage.

| Saisie | Signification | Exemple |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Priorité élevée, moyenne ou faible | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Date d'échéance relative | `Call dentist tomorrow` |
| Jour de la semaine ou `next weekday` | Échéance sur un jour de la semaine | `Send report next monday` |
| `due:YYYY-MM-DD` | Date d'échéance explicite | `Renew membership due:2027-03-15` |
| Heure associée à une date | Heure d'échéance | `Call Alex tomorrow at 3pm` |
| `@context` | Marqueur de contexte | `Buy milk @errands` |
| `+project` | Routage par projet/liste | `Draft outline +website` |

Les formes `due:today` et `due:tomorrow` sont aussi acceptées. Utilisez des lettres, des chiffres, des tirets bas ou des tirets dans les marqueurs de contexte et de projet. La capture rapide native donne la priorité au routage par projet sur le routage par contexte.

La capture Calendrier utilise `@` pour le lieu de l'événement et accepte une durée en minutes ou en heures :

```text
Planning tomorrow 2pm 45m @Conference Room
```

Sans heure ni durée explicites, la capture Calendrier utilise 09h00 et une durée d'une heure, dans le premier calendrier accessible en écriture.

## Choisir un workflow

### Workflows natifs Apple

| Workflow | Comportement | Bundle |
| --- | --- | --- |
| Capture rapide | Analyse le texte de la tâche et crée un rappel | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Capture presse-papiers | Crée un rappel à partir du contenu du presse-papiers | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Capture par lot | Crée des rappels à partir de plusieurs lignes | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Capture d'événement | Crée un événement dans Calendrier | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Revue hebdomadaire | Revue guidée et vidage d'esprit dans Rappels | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Ouvrez un bundle dans Automator pour le tester, ou installez-le dans `~/Library/Services` pour y accéder au clavier. Rappels et Calendrier nécessitent les autorisations Automatisation appropriées de macOS.

### Alfred

Nécessite Alfred avec Powerpack. Générez le paquet à partir des sources actuelles :

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Vous pouvez aussi télécharger le paquet depuis les [releases](https://github.com/somethingwithproof/MacGTD/releases). Les paquets de release reflètent le code source du tag correspondant ; les fonctionnalités ajoutées sur `main` après une release nécessitent un build depuis les sources.

| Mot-clé | Action |
| --- | --- |
| `task` | Capturer une tâche avec analyse de date, contexte, projet et priorité |
| `note` | Enregistrer une note de référence dans Rappels |
| `project` | Créer une liste dans Rappels |
| `gtd process` | Ouvrir la boîte de réception pour une revue manuelle |
| `clip` | Capturer le texte du presse-papiers |
| `gtd focus` | Démarrer une session de concentration, consulter l'état ou arrêter |
| `gtd analytics` | Consulter les durées de concentration enregistrées |
| `gtd preferences` | Modifier les préférences du workflow |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Les préférences sont stockées dans `~/Library/Preferences/com.alfredgtd.plist` ; l'état des sessions de concentration et les logs se trouvent dans `~/.gtd`. Les préférences intègrent des valeurs par défaut, des vérifications de types, des imports validés et des écritures atomiques. Les sessions de concentration ne modifient pas les réglages de notifications du système. Le traitement de la boîte de réception ouvre la liste pour examen ; il ne déplace ni ne termine automatiquement les tâches.

Consultez le [guide Alfred](../../../workflows/alfred/README.md) et la [documentation de la bibliothèque GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Adaptateurs de capture externes

Les quatre workflows de capture API sont testés via de vraies boîtes de dialogue Automator et une fixture TLS locale dans les tests E2E hébergés. Une suite manuelle distincte teste la persistance réelle chez les fournisseurs lorsque des comptes dédiés sont configurés. Things et OmniFocus nécessitent la suite d'intégration desktop avec licences.

| Cible | Mécanisme | Configuration / source |
| --- | --- | --- |
| Todoist | Capture API | [Configuration du workflow et du Trousseau](../../../workflows/todoist/) |
| Notion | Capture API par source de données | [Configuration du workflow et du Trousseau](../../../workflows/notion/) |
| Things 3 | Schéma d'URL | [Workflow](../../../workflows/things/) |
| OmniFocus | AppleScript / schéma d'URL | [Workflow](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Workflow](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Workflow](../../../workflows/google/) |

Les adaptateurs API nécessitent une configuration des identifiants ; Microsoft exige une autorisation OAuth déléguée et Google Keep requiert un accès Workspace éligible :

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Consultez les [prérequis de configuration API, de migration et d'autorisation](../../../workflows/api/README.md). Les identifiants de bases de données Notion existants ne migrent que lorsqu'une seule source de données est détectée. Les captures Microsoft et Google utilisent des API officielles plutôt que des raccourcis navigateur non documentés. Les jetons d'accès OAuth doivent être renouvelés via votre client OAuth. Les charges utiles reposent sur des clés JSON explicites, des requêtes HTTPS bornées et une confirmation de réponse. Les messages d'erreur conservent les détails de l'échec tout en masquant le jeton API configuré. Consultez [SECURITY.md](../../../SECURITY.md) pour signaler un problème de sécurité.

### Barre des menus et Raccourcis

Le [guide de la barre des menus](../../../workflows/menubar/README.md) couvre le plugin optionnel SwiftBar/xbar. Installez d'abord les services Apple, puis configurez le répertoire de plugins dans votre application de barre des menus et liez-y `workflows/menubar/gtd-menubar.sh`.

Le [guide Raccourcis](../../../workflows/shortcuts/README.md) détaille la configuration manuelle pour la capture de texte, du presse-papiers et par Siri sur macOS 12+. Raccourcis et l'activation vocale Siri ne font pas partie de la suite de tests hébergée.

## Architecture

Les bundles Automator embarquent du code AppleScript afin de fonctionner comme des services natifs. Alfred empaquette les scripts d'action et transmet la saisie utilisateur en tant qu'arguments. GTDLib expose les opérations natives partagées de Rappels à partir d'un code source AppleScript éditable et d'un bundle de script compilé.

- **Un seul parseur de production :** `scripts/sync-native-parser.py` intègre le parseur partagé dans la capture rapide et la capture d'événements ; la validation détecte toute dérive entre les sources.
- **État de concentration persistant :** des exécutions distinctes partagent l'état de la session, avec des tâches launchd dédiées et un calcul borné du temps écoulé.
- **Paquets reproductibles :** l'empaquetage produit une archive propre, et les tests comparent son contenu aux sources. La bibliothèque dispose d'un script de compilation dédié.
- **Tests observables :** les rapports JUnit, les logs de commandes et les artefacts de build testés sont conservés pendant 14 jours dans GitHub Actions.

| Répertoire | Responsabilité |
| --- | --- |
| [`workflows/`](../../../workflows/) | Bundles natifs, adaptateurs fournisseurs, Alfred, Raccourcis et scripts de barre des menus |
| [`scripts/`](../../../scripts/) | Empaquetage, compilation de la bibliothèque, synchronisation du parseur et provisionnement des tests hébergés |
| [`tests/`](../../../tests/) | Validation, vérifications de composants et tests E2E natifs desktop |
| [`.github/workflows/`](../../../.github/workflows/) | CI, tests E2E nocturnes/manuels et maintenance du dépôt |
| [`infra/`](../../../infra/) | Configuration optionnelle de runners Mac locaux et EC2 ; la CI hébergée n'en a pas besoin |

<a name="testing-and-compatibility"></a>

## Tests et compatibilité

| Périmètre | Environnement | Ce qui est vérifié |
| --- | --- | --- |
| Validation | macOS 15 et 26 hébergés sur GitHub | Compilation AppleScript, bundles, parseur de production, cibles d'action, préférences, état de concentration, transport API sur fixture et cycles complets d'empaquetage |
| Contrôles de sécurité | Ubuntu et macOS 15 hébergés sur GitHub | CodeQL Python, ShellCheck et fuzzing Atheris borné sur le parseur de production compilé |
| E2E adaptateurs fournisseurs | `macos-15-intel` hébergé sur GitHub | Les quatre boîtes de dialogue API de production, transport TLS, persistance/relecture sur fixture, erreurs API, annulation et sélection de source Notion |
| E2E fournisseurs réels | Exécution manuelle sur Mac hébergé par GitHub avec secrets dédiés | Capture réelle Todoist, Notion, Microsoft et Google avec relecture chez le fournisseur ; échoue si les comptes manquent |
| Intégrations desktop avec licence | Compte local dédié | Invocation et persistance via l'interface de Things 3, OmniFocus 4 et Alfred |
| E2E natif desktop | `macos-15-intel` hébergé sur GitHub | Vraies boîtes de dialogue Automator ; données persistées dans Rappels et Calendrier ; revue hebdomadaire ; compteurs de barre des menus ; GTDLib compilé ; actions natives Alfred empaquetées ; expiration et annulation réelles des minuteurs launchd |
| Interface Alfred optionnelle | Compte local dédié, Alfred 5 + Powerpack | Import du workflow, invocation par mot-clé et relecture des rappels via l'interface sous licence |

L'[exécution vérifiée de modernisation des API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) a réussi **35 tests de validation sur chaque plateforme de validation et 26 tests E2E desktop**, sans aucun échec, erreur ni test ignoré. La couverture desktop comprend 15 tests natifs et 11 tests d'adaptateurs fournisseurs, incluant des vérifications réelles de timeout réseau et d'accès transitoire au Trousseau. La validation exécute également des contrôles de structure du dépôt. Ces résultats couvrent le comportement natif et les fixtures fournisseurs ; ils n'établissent pas la compatibilité réelle avec les fournisseurs ni avec les applications sous licence. L'état actuel est indiqué par les badges ci-dessus.

Les pull requests et les pushs sur `main` lancent la validation suivie des tests E2E natifs. Le workflow E2E s'exécute aussi chaque nuit et à la demande, en incluant les tests déterministes des adaptateurs fournisseurs. Les tests fournisseurs réels passent par le workflow manuel séparé `live-e2e.yml`. La CI par défaut s'appuie sur des Mac éphémères hébergés par GitHub, des fixtures isolées et des sous-processus bornés ; aucun runner auto-hébergé ni identifiant de compte externe n'est requis pour la suite par défaut. La suite manuelle en conditions réelles nécessite des secrets dédiés aux fournisseurs.

Les versions antérieures de macOS ne sont pas validées par la CI actuelle. Les exécutions en conditions réelles avec les fournisseurs demandent des secrets dédiés et n'ont pas encore été vérifiées. Raccourcis/Siri et les applications desktop sous licence sortent du périmètre de la suite hébergée par défaut. Les tests d'actions natives sollicitent directement les scripts Alfred empaquetés ; ils ne prouvent pas une compatibilité complète avec l'interface d'Alfred. Consultez [configuration des tests, prérequis et couverture](../../../tests/e2e/README.md).

## Localisation

Les chaînes visibles par l'utilisateur pour la CLI, le lanceur de tests et la barre des menus sont disponibles en 45 locales (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) dans `locales/` via `scripts/i18n.py`, sans aucune dépendance tierce. La résolution de la locale vérifie `--lang`, puis `LC_ALL`, `LC_MESSAGES` et `LANG`, avec `en` comme valeur de repli.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Développement

Installez [mise](https://mise.jdx.dev/) et utilisez la version de Python épinglée dans `.mise.toml` :

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

La validation écrit les rapports dans `test-results/` ; les scripts de build écrivent dans `dist/`. Pour lancer la suite desktop hébergée sur `main` :

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

L'exécution locale des tests E2E desktop requiert un compte de test connecté dédié ainsi que les permissions décrites dans le [guide E2E](../../../tests/e2e/README.md). Le script hébergé de provisionnement des permissions est réservé aux jobs éphémères hébergés par GitHub.

Utilisez [Conventional Commits](https://www.conventionalcommits.org/) et suivez [CONTRIBUTING.md](../../../CONTRIBUTING.md). Les changements récents sont consignés dans [CHANGELOG.md](../../../CHANGELOG.md).

Les contrôles de sécurité, la vérification des signatures de release et les limitations restantes de Scorecard sont documentés dans l'[évaluation de sécurité](../../../docs/security-assessment.md).
Le workflow de release compile et atteste les paquets avant de créer un brouillon de release, incluant une provenance in-toto signée et des bundles Sigstore vérifiés par rapport au commit et à la référence source. Cette nouvelle provenance s'applique aux builds générés par ce workflow, et non aux téléchargements plus anciens.

## Historique du projet et licence

MacGTD regroupe les anciens dépôts MacGTD-Native, MacGTD-Microsoft, MacGTD-Google et AlfredGTD. Il est distribué sous [licence MIT](../../../LICENSE).
