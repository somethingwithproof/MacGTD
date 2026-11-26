# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · **Français** · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD est une collection de flux de travail macOS permettant de capturer des tâches, d'organiser des rappels et d'exécuter des sessions de concentration minutées avec les applications que vous utilisez déjà.**

Conçu autour de la méthode [Getting Things Done](https://gettingthingsdone.com/), il apporte la capture par boîte de dialogue, par presse-papiers et par lots à Apple Rappels ; la capture d'événements à Calendrier ; ainsi que des commandes de tâches, de notes, de projets et de concentration à Alfred. AppleScript et Automator maintiennent les flux natifs au plus près de macOS. Les adaptateurs d'API utilisent Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 et Google Keep v1. Des adaptateurs pour Things et OmniFocus sont également inclus. Les tests hébergés vérifient les adaptateurs d'API par rapport à une fixture HTTPS locale ; la compatibilité en conditions réelles nécessite toujours des comptes dédiés auprès des fournisseurs.

## Ce que vous pouvez faire

- **Capturez sans changer d'application.** Utilisez un service Automator, un mot-clé Alfred ou le presse-papiers pour ajouter une tâche. La capture par lots crée un rappel par ligne non vide.
- **Transformez du texte en tâches structurées.** Analysez les dates relatives et ISO, les heures, les priorités, les contextes et les projets à l'aide de l'analyseur AppleScript de production partagé par la capture rapide native et la capture dans Calendrier.
- **Capturez des événements et passez en revue votre boîte de réception.** Créez des événements Calendrier avec une heure, une durée et un lieu ; effectuez une revue hebdomadaire en cinq étapes accompagnée d'une collecte d'idées dans Rappels.
- **Travaillez par sessions de concentration minutées.** Démarrez, inspectez et arrêtez des sessions entre plusieurs processus. Des minuteurs launchd propres à chaque session gèrent l'expiration et l'annulation ; les journaux JSONL fournissent des statistiques de durée.
- **Utilisez Alfred pour bien plus que des tâches.** Créez des listes Rappels pour vos projets, enregistrez des notes de référence, ouvrez la boîte de réception pour la passer en revue, capturez le texte du presse-papiers et modifiez les préférences typées.
- **Consultez votre boîte de réception depuis la barre des menus.** Le greffon optionnel SwiftBar/xbar affiche le nombre d'éléments incomplets dans la boîte de réception et propose des liens vers les flux de capture.

Le comportement natif est vérifié sur de véritables Mac hébergés par GitHub : les tests interagissent avec les boîtes de dialogue Automator, puis relisent les enregistrements dans Rappels et Calendrier. Consultez [tests et compatibilité](#tests-et-compatibilité) pour connaître la portée de ces vérifications.

## Démarrage rapide : Apple Rappels

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Ouvrez le flux de travail dans Automator et exécutez-le pour essayer la capture. Pour le rendre disponible en tant que service, installez le paquet dans `~/Library/Services` :

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Attribuez un raccourci dans **Réglages Système → Clavier → Raccourcis clavier → Services**. Autorisez l'accès d'automatisation à Rappels lorsque macOS le demande. Saisissez :

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Le flux de travail natif crée un rappel de priorité élevée pour demain, l'oriente vers la liste `shopping` et enregistre le contexte. Sans marqueur de projet ou de contexte, la capture rapide utilise `Inbox`.

## Syntaxe de capture

L'analyseur de tâches natif et la capture de tâches Alfred reconnaissent ces marqueurs. Les adaptateurs de fournisseurs disposent de leur propre prise en charge des champs et du routage.

| Entrée | Signification | Exemple |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Priorité haute, moyenne ou basse | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Échéance relative | `Call dentist tomorrow` |
| Jour de la semaine ou `next weekday` | Échéance par jour de la semaine | `Send report next monday` |
| `due:YYYY-MM-DD` | Date d'échéance explicite | `Renew membership due:2027-03-15` |
| Heure accompagnant une date | Heure d'échéance | `Call Alex tomorrow at 3pm` |
| `@context` | Marqueur de contexte | `Buy milk @errands` |
| `+project` | Routage vers un projet/une liste | `Draft outline +website` |

`due:today` et `due:tomorrow` sont également acceptés. Utilisez des lettres, des chiffres, des tirets bas ou des traits d'union dans les marqueurs de contexte et de projet. La capture rapide native donne la priorité au routage par projet sur le routage par contexte.

La capture dans Calendrier utilise `@` pour le lieu de l'événement et accepte une durée en minutes ou en heures :

```text
Planning tomorrow 2pm 45m @Conference Room
```

Sans heure ni durée explicite, la capture dans Calendrier utilise 9 h 00 et une durée d'une heure, dans le premier calendrier accessible en écriture.

## Choisir un flux de travail

### Flux de travail Apple natifs

| Flux de travail | Comportement | Paquet |
| --- | --- | --- |
| Capture rapide | Analyse le texte de la tâche et crée un rappel | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Capture du presse-papiers | Crée un rappel à partir du texte du presse-papiers | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Capture par lots | Crée des rappels à partir de plusieurs lignes | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Capture d'événement | Crée un événement Calendrier | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Revue hebdomadaire | Revue guidée et collecte d'idées dans Rappels | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Ouvrez un paquet dans Automator pour l'essayer, ou installez-le dans `~/Library/Services` pour y accéder au clavier. Rappels et Calendrier nécessitent les autorisations d'automatisation macOS appropriées.

### Alfred

Nécessite Alfred avec Powerpack. Compilez le paquet à partir des sources actuelles :

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Vous pouvez également télécharger le paquet depuis la page des [versions](https://github.com/somethingwithproof/MacGTD/releases). Les paquets publiés reflètent leur code source étiqueté ; les fonctionnalités ajoutées à `main` après une publication nécessitent une compilation depuis les sources.

| Mot-clé | Action |
| --- | --- |
| `task` | Capturer une tâche avec analyse de la date, du contexte, du projet et de la priorité |
| `note` | Enregistrer une note de référence dans Rappels |
| `project` | Créer une liste dans Rappels |
| `gtd process` | Ouvrir la boîte de réception pour une revue manuelle |
| `clip` | Capturer le texte du presse-papiers |
| `gtd focus` | Démarrer une session de concentration, consulter son état ou l'arrêter |
| `gtd analytics` | Consulter les durées de concentration enregistrées |
| `gtd preferences` | Modifier les préférences du flux de travail |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Les préférences résident dans `~/Library/Preferences/com.alfredgtd.plist` ; l'état des sessions de concentration et les journaux résident sous `~/.gtd`. Les préférences disposent de valeurs par défaut intégrées, de vérifications de type, d'imports validés et d'écritures atomiques. Les sessions de concentration ne modifient pas les réglages de notification du système. Le traitement de la boîte de réception ouvre la liste pour examen ; il ne déplace ni ne termine automatiquement les tâches.

Consultez le [guide Alfred](../../../workflows/alfred/README.md) et la [documentation de la bibliothèque GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Adaptateurs de capture externes

Les quatre flux de travail de capture par API sont testés via de véritables boîtes de dialogue Automator et une fixture TLS locale dans les tests E2E hébergés. Une suite manuelle distincte teste la persistance réelle chez les fournisseurs lorsque des comptes dédiés sont configurés. Things et OmniFocus nécessitent la suite d'intégration bureautique sous licence.

| Cible | Mécanisme | Configuration / source |
| --- | --- | --- |
| Todoist | Capture par API | [Configuration du flux et du Trousseau](../../../workflows/todoist/) |
| Notion | Capture par API de source de données | [Configuration du flux et du Trousseau](../../../workflows/notion/) |
| Things 3 | Schéma d'URL | [Flux de travail](../../../workflows/things/) |
| OmniFocus | AppleScript / schéma d'URL | [Flux de travail](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Flux de travail](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Flux de travail](../../../workflows/google/) |

Les adaptateurs d'API nécessitent une configuration d'identifiants ; Microsoft requiert une autorisation OAuth déléguée et Google Keep requiert un accès Workspace éligible :

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Consultez les [prérequis de configuration, migration et autorisation des API](../../../workflows/api/README.md). Les identifiants de base de données Notion existants ne migrent que lorsqu'une seule source de données est trouvée. La capture Microsoft et Google utilise des API plutôt que des raccourcis navigateur non documentés. Les jetons d'accès OAuth doivent être renouvelés via votre client OAuth. Les charges utiles utilisent des clés JSON explicites, des requêtes HTTPS bornées et une confirmation de réponse. Les messages d'erreur conservent les détails de l'échec tout en masquant le jeton d'API configuré. Consultez [SECURITY.md](../../../SECURITY.md) pour signaler des problèmes de sécurité.

### Barre des menus et Raccourcis

Le [guide de la barre des menus](../../../workflows/menubar/README.md) présente le greffon optionnel SwiftBar/xbar. Installez d'abord les services Apple, puis configurez le répertoire des greffons dans votre application de barre des menus et liez-y `workflows/menubar/gtd-menubar.sh`.

Le [guide Raccourcis](../../../workflows/shortcuts/README.md) fournit la configuration manuelle pour la capture par texte, par presse-papiers et via Siri sur macOS 12+. Raccourcis et l'activation vocale par Siri sont en dehors de la suite de tests hébergée.

## Architecture

Les paquets Automator embarquent du code AppleScript afin de s'exécuter comme des services natifs. Alfred empaquette les scripts d'action et transmet la saisie utilisateur sous forme d'arguments. GTDLib expose des opérations natives partagées pour Rappels à partir d'un code source AppleScript modifiable et d'un paquet de script compilé.

- **Un seul analyseur de production :** `scripts/sync-native-parser.py` intègre l'analyseur partagé dans la capture rapide et la capture d'événement ; la validation détecte toute dérive du code source.
- **État de concentration persistant :** des invocations distinctes partagent l'état de la session, avec des tâches launchd dédiées et un décompte borné du temps écoulé.
- **Paquets reproductibles :** l'empaquetage construit une nouvelle archive et les tests comparent son contenu aux sources. La bibliothèque dispose d'un script de compilation distinct.
- **Tests observables :** les rapports JUnit, les journaux de commandes et les artefacts de compilation testés sont conservés pendant 14 jours dans GitHub Actions.

| Répertoire | Responsabilité |
| --- | --- |
| [`workflows/`](../../../workflows/) | Paquets natifs, adaptateurs de fournisseurs, Alfred, Raccourcis et scripts de barre des menus |
| [`scripts/`](../../../scripts/) | Empaquetage, compilation de la bibliothèque, synchronisation de l'analyseur et provisionnement des tests hébergés |
| [`tests/`](../../../tests/) | Validation, vérifications des composants et tests E2E natifs sur poste de travail |
| [`.github/workflows/`](../../../.github/workflows/) | Intégration continue, E2E nocturnes/manuels et maintenance du dépôt |
| [`infra/`](../../../infra/) | Configuration optionnelle d'exécuteurs Mac locaux et EC2 ; l'intégration continue hébergée ne la requiert pas |

## Tests et compatibilité

| Périmètre | Environnement | Éléments vérifiés |
| --- | --- | --- |
| Validation | macOS 15 et 26 hébergés par GitHub | Compilation AppleScript, paquets, analyseur de production, cibles d'action, préférences, état de concentration, transport API sur fixture et allers-retours d'empaquetage |
| Contrôles de sécurité | Ubuntu et macOS 15 hébergés par GitHub | CodeQL Python, ShellCheck et fuzzing Atheris borné de l'analyseur de production compilé |
| E2E adaptateurs de fournisseurs | `macos-15-intel` hébergé par GitHub | Les quatre boîtes de dialogue API de production, transport TLS, persistance/relecture sur fixture, erreurs d'API, annulation et sélection de source Notion |
| E2E fournisseurs en conditions réelles | Exécution manuelle sur Mac hébergé par GitHub avec secrets dédiés | Capture et relecture réelles auprès de Todoist, Notion, Microsoft et Google ; échoue si des comptes manquent |
| Intégrations bureautiques sous licence | Compte local dédié | Invocation via l'interface et persistance pour Things 3, OmniFocus 4 et Alfred |
| E2E natif sur poste de travail | `macos-15-intel` hébergé par GitHub | Véritables boîtes de dialogue Automator ; données Rappels et Calendrier persistées ; revue hebdomadaire ; compteurs du menu ; GTDLib compilée ; actions natives Alfred empaquetées ; expiration et annulation réelles des minuteurs launchd |
| Interface Alfred optionnelle | Compte local dédié, Alfred 5 + Powerpack | Importation du flux de travail, invocation par mot-clé et relecture des rappels via l'interface sous licence |

L'[exécution vérifiée de modernisation des API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) a réussi **35 tests de validation sur chaque plateforme de validation et 26 tests E2E sur poste de travail**, sans aucun échec, aucune erreur ni aucun test ignoré. La couverture poste de travail inclut 15 tests natifs et 11 tests d'adaptateurs de fournisseurs, y compris les délais d'expiration réels de transport et les vérifications transitoires du Trousseau. La validation exécute également des contrôles de structure du dépôt. Ces résultats couvrent le comportement natif et les fixtures de fournisseurs ; ils n'établissent pas la compatibilité en direct avec les fournisseurs ni avec les applications sous licence. L'état actuel est indiqué par les badges ci-dessus.

Les pull requests et les pushs sur `main` déclenchent la validation suivie des tests E2E natifs. Le flux E2E s'exécute également chaque nuit et sur déclenchement manuel, incluant les tests déterministes des adaptateurs de fournisseurs. Les tests fournisseurs en conditions réelles utilisent le flux manuel distinct `live-e2e.yml`. L'intégration continue par défaut utilise des Mac jetables hébergés par GitHub, des fixtures isolées et des sous-processus bornés ; aucun exécuteur auto-hébergé ni identifiant de compte externe n'est nécessaire pour la suite par défaut. La suite manuelle en conditions réelles nécessite des secrets dédiés auprès des fournisseurs.

Les versions antérieures de macOS ne sont pas validées par l'intégration continue actuelle. Les exécutions en conditions réelles avec les fournisseurs nécessitent des secrets dédiés et n'ont pas encore été vérifiées. Raccourcis/Siri et les applications bureautiques sous licence sont hors du périmètre de la suite hébergée par défaut. Les tests d'actions natives sollicitent directement les scripts Alfred empaquetés ; ils n'établissent pas une compatibilité complète avec l'interface d'Alfred. Consultez la [configuration des tests, les prérequis et la couverture](../../../tests/e2e/README.md).

## Localisation

Les chaînes destinées à l'utilisateur de l'interface en ligne de commande, du lanceur de tests et de la barre des menus sont fournies en 45 langues (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) sous `locales/` via `scripts/i18n.py` sans aucune dépendance tierce. La résolution de la langue vérifie `--lang`, puis `LC_ALL`, `LC_MESSAGES` et `LANG`, avec `en` comme solution de repli.

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

La validation écrit les rapports sous `test-results/` ; les scripts de compilation écrivent dans `dist/`. Pour exécuter la suite bureautique hébergée sur `main` :

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Les tests E2E locaux sur poste de travail nécessitent un compte de test dédié connecté et les autorisations décrites dans le [guide E2E](../../../tests/e2e/README.md). Le script de provisionnement des autorisations hébergées est réservé aux tâches jetables hébergées par GitHub.

Utilisez [Conventional Commits](https://www.conventionalcommits.org/) et suivez [CONTRIBUTING.md](../../../CONTRIBUTING.md). Les changements récents sont consignés dans [CHANGELOG.md](../../../CHANGELOG.md).

Les contrôles de sécurité, la vérification des signatures de publication et les limitations restantes de Scorecard sont documentés dans l'[évaluation de sécurité](../../../docs/security-assessment.md).
Le flux de travail de publication compile et atteste les paquets avant de créer une version brouillon,
incluant une provenance in-toto signée et des paquets Sigstore vérifiés par rapport au
commit et à la référence source. Cette nouvelle provenance s'applique à ces compilations issues du flux de travail, et non aux
téléchargements antérieurs.

## Historique du projet et licence

MacGTD regroupe les anciens dépôts MacGTD-Native, MacGTD-Microsoft, MacGTD-Google et AlfredGTD. Il est distribué sous [licence MIT](../../../LICENSE).
