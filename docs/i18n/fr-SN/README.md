# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · **Français (Sénégal)** · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD est une collection de workflows macOS conçue pour capturer vos tâches, organiser vos rappels et mener des sessions de concentration minutées avec les applications que vous utilisez déjà.**

Conçu autour de la méthode [Getting Things Done](https://gettingthingsdone.com/), il apporte la capture par boîte de dialogue, par presse-papiers et par lot à Apple Reminders ; la capture d'événements à Calendar ; ainsi que des commandes de tâches, de notes, de projets et de concentration à Alfred. AppleScript et Automator maintiennent les workflows natifs au plus près de macOS. Les adaptateurs API s'appuient sur Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 et Google Keep v1. Des adaptateurs pour Things et OmniFocus sont également inclus. Les tests hébergés vérifient les adaptateurs API à l'aide d'une fixture HTTPS locale ; la compatibilité en conditions réelles nécessite toujours des comptes dédiés auprès de chaque fournisseur.

## Ce que vous pouvez faire

- **Capturer sans changer d'application.** Utilisez un Service Automator, un mot-clé Alfred ou le presse-papiers pour ajouter une tâche. La capture par lot crée un rappel pour chaque ligne non vide.
- **Transformer du texte en tâches structurées.** Analysez les dates relatives et ISO, les heures, les priorités, les contextes et les projets grâce à l'analyseur AppleScript de production, partagé par la capture rapide native et la capture Calendar.
- **Capturer des événements et passer en revue votre boîte de réception.** Créez des événements Calendar avec une heure, une durée et un lieu ; effectuez un bilan hebdomadaire en cinq étapes accompagné d'une mise à plat de vos idées directement dans Apple Reminders.
- **Travailler par sessions de concentration minutées.** Démarrez, consultez et arrêtez des sessions d'un processus à l'autre. Des minuteurs launchd dédiés à la session gèrent l'expiration et l'annulation ; les journaux JSONL fournissent des statistiques de durée.
- **Utiliser Alfred au-delà des simples tâches.** Créez des listes Apple Reminders pour vos projets, enregistrez des notes de référence, ouvrez la boîte de réception pour révision, capturez le texte du presse-papiers et modifiez des préférences typées.
- **Garder un œil sur votre boîte de réception depuis la barre de menus.** Le plugin optionnel SwiftBar/xbar affiche le nombre d'éléments incomplets dans la boîte de réception et donne accès aux workflows de capture.

Le comportement natif est vérifié sur de vrais Mac hébergés sur GitHub : les tests pilotent les boîtes de dialogue Automator, puis relisent les entrées enregistrées dans Apple Reminders et Calendar. Consultez la section [tests et compatibilité](#testing-and-compatibility) pour connaître la portée de ces vérifications.

## Prise en main rapide : Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Ouvrez le workflow dans Automator et exécutez-le pour essayer la capture. Pour le rendre disponible comme Service, installez le paquet dans `~/Library/Services` :

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Attribuez un raccourci dans **Réglages Système → Clavier → Raccourcis clavier → Services**. Autorisez l'accès Automation à Apple Reminders lorsque macOS vous le demande. Saisissez :

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Le workflow natif crée un rappel de priorité élevée pour demain, l'achemine vers la liste `shopping` et enregistre le contexte. Sans marqueur de projet ni de contexte, la capture rapide utilise `Inbox`.

## Syntaxe de capture

L'analyseur natif de tâches et la capture de tâches Alfred reconnaissent ces marqueurs. Les adaptateurs de fournisseurs disposent de leur propre prise en charge des champs et du routage.

| Saisie | Signification | Exemple |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Priorité élevée, moyenne ou basse | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Échéance relative | `Call dentist tomorrow` |
| Jour de la semaine ou `next weekday` | Échéance au jour de la semaine | `Send report next monday` |
| `due:YYYY-MM-DD` | Échéance explicite | `Renew membership due:2027-03-15` |
| Heure associée à une date | Heure d'échéance | `Call Alex tomorrow at 3pm` |
| `@context` | Marqueur de contexte | `Buy milk @errands` |
| `+project` | Routage vers un projet ou une liste | `Draft outline +website` |

`due:today` et `due:tomorrow` sont aussi acceptés. Utilisez des lettres, des chiffres, des tirets bas ou des tirets dans les marqueurs de contexte et de projet. La capture rapide native donne la priorité au routage par projet sur le routage par contexte.

La capture Calendar utilise `@` pour indiquer le lieu de l'événement et accepte une durée en minutes ou en heures :

```text
Planning tomorrow 2pm 45m @Conference Room
```

Sans heure ni durée explicite, la capture Calendar utilise 9 h 00 et une durée d'une heure, dans le premier calendrier accessible en écriture.

## Choisir un workflow

### Workflows natifs Apple

| Workflow | Comportement | Paquet |
| --- | --- | --- |
| Capture rapide | Analyse le texte d'une tâche et crée un rappel | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Capture du presse-papiers | Crée un rappel à partir du texte du presse-papiers | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Capture par lot | Crée des rappels à partir de plusieurs lignes | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Capture d'événement | Crée un événement Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Bilan hebdomadaire | Revue guidée et mise à plat des idées dans les rappels | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Ouvrez un paquet dans Automator pour le tester, ou installez-le dans `~/Library/Services` afin d'y accéder au clavier. Apple Reminders et Calendar nécessitent les autorisations macOS Automation appropriées.

### Alfred

Nécessite Alfred avec Powerpack. Compilez le paquet à partir des sources actuelles :

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Vous pouvez également télécharger le paquet depuis les [versions publiées](https://github.com/somethingwithproof/MacGTD/releases). Les paquets de version correspondent au code source de leur étiquette ; les fonctionnalités ajoutées à `main` après une publication nécessitent une compilation depuis les sources.

| Mot-clé | Action |
| --- | --- |
| `task` | Capture une tâche avec analyse de la date, du contexte, du projet et de la priorité |
| `note` | Enregistre une note de référence dans Apple Reminders |
| `project` | Crée une liste dans Apple Reminders |
| `gtd process` | Ouvre la boîte de réception pour une revue manuelle |
| `clip` | Capture le texte du presse-papiers |
| `gtd focus` | Démarre une session de concentration, consulte son état ou l'arrête |
| `gtd analytics` | Consulte les durées de concentration enregistrées |
| `gtd preferences` | Modifie les préférences du workflow |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Les préférences sont enregistrées dans `~/Library/Preferences/com.alfredgtd.plist` ; l'état et les journaux des sessions de concentration se trouvent dans `~/.gtd`. Les préférences disposent de valeurs par défaut intégrées, de contrôles de type, d'importations validées et d'écritures atomiques. Les sessions de concentration ne modifient pas les réglages de notifications du système. Le traitement de la boîte de réception ouvre simplement la liste pour révision ; il ne déplace ni ne termine automatiquement les tâches.

Consultez le [guide Alfred](../../../workflows/alfred/README.md) et la [documentation de la bibliothèque GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Adaptateurs de capture externes

Les quatre workflows de capture par API sont testés via de vraies boîtes de dialogue Automator et une fixture TLS locale dans les tests E2E hébergés. Une suite manuelle distincte vérifie la persistance réelle chez les fournisseurs lorsque des comptes dédiés sont configurés. Things et OmniFocus nécessitent la suite d'intégration pour applications de bureau sous licence.

| Cible | Mécanisme | Configuration / source |
| --- | --- | --- |
| Todoist | Capture API | [Workflow et configuration Keychain](../../../workflows/todoist/) |
| Notion | Capture API de source de données | [Workflow et configuration Keychain](../../../workflows/notion/) |
| Things 3 | Schéma d'URL | [Workflow](../../../workflows/things/) |
| OmniFocus | AppleScript / Schéma d'URL | [Workflow](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Workflow](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Workflow](../../../workflows/google/) |

Les adaptateurs API exigent la configuration des identifiants ; Microsoft requiert une autorisation OAuth déléguée et Google Keep un accès Workspace éligible :

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Consultez les [exigences de configuration, de migration et d'autorisation API](../../../workflows/api/README.md). Les identifiants de base de données Notion existants ne migrent que lorsqu'une seule source de données est détectée. Les captures Microsoft et Google passent par les API officielles plutôt que par des raccourcis navigateur non documentés. Les jetons d'accès OAuth doivent être renouvelés via votre client OAuth. Les charges utiles emploient des clés JSON explicites, des requêtes HTTPS bornées et une confirmation de réponse. Les messages d'erreur conservent les détails de l'échec tout en masquant le jeton API configuré. Consultez [SECURITY.md](../../../SECURITY.md) pour signaler un problème de sécurité.

### Barre de menus et Shortcuts

Le [guide de la barre de menus](../../../workflows/menubar/README.md) présente le plugin optionnel SwiftBar/xbar. Installez d'abord les Services Apple, configurez ensuite le dossier des plugins dans votre application de barre de menus, puis créez-y un lien vers `workflows/menubar/gtd-menubar.sh`.

Le [guide Shortcuts](../../../workflows/shortcuts/README.md) décrit la configuration manuelle de la capture par texte, presse-papiers et Siri sous macOS 12+. Shortcuts et l'activation vocale Siri sont en dehors de la suite de tests hébergée.

## Architecture

Les paquets Automator embarquent du code AppleScript afin de s'exécuter comme Services natifs. Alfred empaquette les scripts d'action et transmet la saisie utilisateur en arguments. GTDLib expose des opérations natives partagées pour Apple Reminders à partir d'un code source AppleScript modifiable et d'un paquet de script compilé.

- **Un seul analyseur de production :** `scripts/sync-native-parser.py` intègre l'analyseur partagé dans la capture rapide et la capture d'événements ; la validation détecte toute dérive par rapport aux sources.
- **État de concentration persistant :** des exécutions distinctes partagent l'état de la session, avec des tâches launchd dédiées et un décompte borné du temps écoulé.
- **Paquets reproductibles :** l'empaquetage génère une nouvelle archive et les tests comparent son contenu aux sources. La bibliothèque dispose d'un script de compilation séparé.
- **Tests observables :** les rapports JUnit, les journaux de commandes et les artefacts de compilation testés sont conservés pendant 14 jours dans GitHub Actions.

| Dossier | Responsabilité |
| --- | --- |
| [`workflows/`](../../../workflows/) | Paquets natifs, adaptateurs de fournisseurs, scripts Alfred, Shortcuts et barre de menus |
| [`scripts/`](../../../scripts/) | Empaquetage, compilation de la bibliothèque, synchronisation de l'analyseur et provisionnement des tests hébergés |
| [`tests/`](../../../tests/) | Validation, vérifications de composants et tests E2E natifs sur poste de travail |
| [`.github/workflows/`](../../../.github/workflows/) | CI, tests E2E nocturnes/manuels et maintenance du dépôt |
| [`infra/`](../../../infra/) | Configuration optionnelle de runners Mac locaux et EC2 ; la CI hébergée n'en a pas besoin |

## Tests et compatibilité

| Périmètre | Environnement | Éléments vérifiés |
| --- | --- | --- |
| Validation | macOS 15 et 26 hébergés sur GitHub | Compilation AppleScript, paquets, analyseur de production, cibles d'action, préférences, état de concentration, transport API sur fixture et intégrité des paquets |
| Contrôles de sécurité | Ubuntu et macOS 15 hébergés sur GitHub | CodeQL pour Python, ShellCheck et fuzzing borné Atheris sur l'analyseur de production compilé |
| E2E des adaptateurs de fournisseurs | `macos-15-intel` hébergé sur GitHub | Les quatre boîtes de dialogue API de production, transport TLS, persistance et relecture sur fixture, erreurs API, annulation et sélection de source Notion |
| E2E fournisseurs en conditions réelles | Exécution manuelle sur Mac hébergé par GitHub avec secrets dédiés | Capture réelle et relecture côté fournisseur pour Todoist, Notion, Microsoft et Google ; échoue si les comptes manquent |
| Intégrations d'applications de bureau sous licence | Compte local dédié | Appel et persistance via l'interface de Things 3, OmniFocus 4 et Alfred |
| E2E natifs sur poste de travail | `macos-15-intel` hébergé sur GitHub | Vraies boîtes de dialogue Automator ; données persistées dans Apple Reminders et Calendar ; bilan hebdomadaire ; compteurs de la barre de menus ; GTDLib compilé ; actions natives Alfred empaquetées ; expiration et annulation réelles des minuteurs launchd |
| Interface Alfred optionnelle | Compte local dédié, Alfred 5 + Powerpack | Importation du workflow, appel par mot-clé et relecture des rappels via l'interface sous licence |

L'[exécution vérifiée de modernisation API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) a réussi **35 tests de validation sur chaque plateforme de validation et 26 tests E2E sur poste de travail**, sans échec, erreur ni test ignoré. La couverture poste de travail comprend 15 tests natifs et 11 tests d'adaptateurs de fournisseurs, incluant des vérifications réelles de délai d'expiration réseau et d'accès transitoire au Keychain. La validation contrôle aussi la structure du dépôt. Ces résultats couvrent le comportement natif et les fixtures de fournisseurs ; ils ne démontrent pas la compatibilité en direct avec les fournisseurs ni avec les applications sous licence. L'état actuel apparaît sur les badges ci-dessus.

Les pull requests et les envois vers `main` lancent la validation suivie des tests E2E natifs. Le workflow E2E s'exécute également chaque nuit et sur déclenchement manuel, en incluant les tests déterministes des adaptateurs de fournisseurs. Les tests en direct auprès des fournisseurs utilisent le workflow manuel distinct `live-e2e.yml`. La CI par défaut s'appuie sur des Mac éphémères hébergés sur GitHub, des fixtures isolées et des sous-processus bornés ; aucun runner auto-hébergé ni identifiant de compte externe n'est requis pour la suite par défaut. La suite manuelle en direct demande des secrets dédiés par fournisseur.

Les versions antérieures de macOS ne sont pas validées par la CI actuelle. Les exécutions en direct auprès des fournisseurs nécessitent des secrets dédiés et n'ont pas encore été vérifiées. Shortcuts/Siri ainsi que les applications de bureau sous licence ne font pas partie de la suite hébergée par défaut. Les tests d'actions natives sollicitent directement les scripts Alfred empaquetés ; ils ne prouvent pas une compatibilité complète avec l'interface Alfred. Consultez la [configuration, les prérequis et la couverture des tests](../../../tests/e2e/README.md).

## Localisation

Les chaînes destinées aux utilisateurs pour la CLI, le lanceur de tests et la barre de menus sont fournies en 45 locales (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) dans `locales/` via `scripts/i18n.py`, sans aucune dépendance tierce. La résolution de la locale vérifie `--lang`, puis `LC_ALL`, `LC_MESSAGES` et `LANG`, avant de se rabattre sur `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Développement

Installez [mise](https://mise.jdx.dev/) et utilisez la version de Python figée dans `.mise.toml` :

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

La validation enregistre ses rapports dans `test-results/` ; les scripts de compilation écrivent dans `dist/`. Pour lancer la suite poste de travail hébergée sur `main` :

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Les tests E2E locaux sur poste de travail requièrent un compte de test dédié connecté ainsi que les autorisations décrites dans le [guide E2E](../../../tests/e2e/README.md). Le script hébergé de provisionnement des autorisations est réservé aux tâches éphémères hébergées sur GitHub.

Utilisez [Conventional Commits](https://www.conventionalcommits.org/) et suivez [CONTRIBUTING.md](../../../CONTRIBUTING.md). Les changements récents sont consignés dans [CHANGELOG.md](../../../CHANGELOG.md).

Les contrôles de sécurité, la vérification des signatures de version et les limites
restantes de Scorecard sont documentés dans l'[évaluation de sécurité](../../../docs/security-assessment.md).
Le workflow de publication compile et atteste les paquets avant de créer un brouillon de version,
avec notamment une provenance in-toto signée et des paquets Sigstore vérifiés par rapport au
commit source et à la référence. Cette nouvelle provenance s'applique à ces compilations de workflow,
et non aux anciens téléchargements.

## Historique du projet et licence

MacGTD regroupe les anciens dépôts MacGTD-Native, MacGTD-Microsoft, MacGTD-Google et AlfredGTD. Il est distribué sous [licence MIT](../../../LICENSE).
