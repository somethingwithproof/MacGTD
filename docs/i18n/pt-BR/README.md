# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · **Português (BR)** · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**O MacGTD é uma coleção de fluxos de trabalho para macOS para capturar tarefas, organizar lembretes e executar sessões de foco cronometradas com os aplicativos que você já usa.**

Construído em torno do [Getting Things Done](https://gettingthingsdone.com/), ele traz captura por caixa de diálogo, área de transferência e em lote para o Apple Reminders; captura de eventos para o Calendar; e comandos de tarefa, nota, projeto e foco para o Alfred. AppleScript e Automator mantêm os fluxos de trabalho nativos integrados ao macOS. Os adaptadores de API usam Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 e Google Keep v1. Adaptadores para Things e OmniFocus também estão incluídos. Testes hospedados verificam os adaptadores de API contra uma fixture HTTPS local; a compatibilidade em ambiente real ainda requer contas dedicadas dos provedores.

## O que você pode fazer

- **Capture sem trocar de aplicativo.** Use um Serviço do Automator, uma palavra-chave do Alfred ou a área de transferência para adicionar uma tarefa. A captura em lote cria um lembrete para cada linha não vazia.
- **Transforme texto em tarefas estruturadas.** Analise datas relativas e ISO, horários, prioridades, contextos e projetos usando o parser AppleScript de produção compartilhado pela captura rápida nativa e pela captura do Calendar.
- **Capture eventos e revise sua caixa de entrada.** Crie eventos do Calendar com horário, duração e local; execute uma revisão semanal em cinco etapas com um despejo de ideias (brain dump) no Reminders.
- **Trabalhe em sessões de foco cronometradas.** Inicie, inspecione e interrompa sessões entre processos. Timers do launchd pertencentes à sessão gerenciam expiração e cancelamento; logs em JSONL fornecem análises de duração.
- **Use o Alfred para mais do que tarefas.** Crie listas do Reminders para projetos, salve notas de referência, abra a caixa de entrada para revisão, capture texto da área de transferência e edite preferências tipadas.
- **Veja sua caixa de entrada na barra de menus.** O plugin opcional para SwiftBar/xbar exibe a contagem de itens incompletos da caixa de entrada e links para os fluxos de trabalho de captura.

O comportamento nativo é verificado em Macs reais hospedados no GitHub: os testes operam caixas de diálogo do Automator e, em seguida, leem de volta os registros do Reminders e do Calendar. Consulte [testes e compatibilidade](#testing-and-compatibility) para saber o escopo dessas evidências.

## Início rápido: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Abra o fluxo de trabalho no Automator e execute-o para testar a captura. Para disponibilizá-lo como um Serviço, instale o pacote em `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Atribua um atalho em **Ajustes do Sistema → Teclado → Atalhos de Teclado → Serviços**. Permita o acesso de Automação ao Reminders quando o macOS solicitar. Digite:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

O fluxo de trabalho nativo cria um lembrete de alta prioridade com vencimento para amanhã, direciona-o para a lista `shopping` e registra o contexto. Sem um marcador de projeto ou contexto, a captura rápida usa `Inbox`.

## Sintaxe de captura

O parser de tarefas nativo e a captura de tarefas do Alfred reconhecem estes marcadores. Os adaptadores dos provedores têm seu próprio suporte a campos e roteamento.

| Entrada | Significado | Exemplo |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Prioridade alta, média ou baixa | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Data de vencimento relativa | `Call dentist tomorrow` |
| Dia da semana ou `next weekday` | Data de vencimento por dia da semana | `Send report next monday` |
| `due:YYYY-MM-DD` | Data de vencimento explícita | `Renew membership due:2027-03-15` |
| Horário junto a uma data | Horário de vencimento | `Call Alex tomorrow at 3pm` |
| `@context` | Marcador de contexto | `Buy milk @errands` |
| `+project` | Roteamento de projeto/lista | `Draft outline +website` |

`due:today` e `due:tomorrow` também são aceitos. Use letras, números, sublinhados ou hifens nos marcadores de contexto e projeto. A captura rápida nativa dá precedência ao roteamento por projeto sobre o roteamento por contexto.

A captura do Calendar usa `@` para o local do evento e aceita uma duração em minutos ou horas:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Sem um horário ou duração explícitos, a captura do Calendar usa 9:00 AM e uma hora, no primeiro calendário gravável.

## Escolha um fluxo de trabalho

### Fluxos de trabalho nativos da Apple

| Fluxo de trabalho | Comportamento | Pacote |
| --- | --- | --- |
| Captura rápida | Analisa o texto da tarefa e cria um lembrete | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Captura da área de transferência | Cria um lembrete a partir do texto da área de transferência | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Captura em lote | Cria lembretes a partir de múltiplas linhas | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Captura de evento | Cria um evento no Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Revisão semanal | Revisão guiada e despejo de ideias de lembretes | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Abra um pacote no Automator para testá-lo ou instale-o em `~/Library/Services` para acesso via teclado. O Reminders e o Calendar precisam das permissões apropriadas de Automação do macOS.

### Alfred

Requer Alfred com Powerpack. Compile o pacote a partir do código-fonte atual:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Você também pode baixar o pacote em [releases](https://github.com/somethingwithproof/MacGTD/releases). Os pacotes de lançamento refletem o código-fonte da tag correspondente; recursos adicionados à `main` após um lançamento exigem uma compilação a partir do código-fonte.

| Palavra-chave | Ação |
| --- | --- |
| `task` | Capturar uma tarefa com análise de data, contexto, projeto e prioridade |
| `note` | Armazenar uma nota de referência no Reminders |
| `project` | Criar uma lista no Reminders |
| `gtd process` | Abrir a Inbox para revisão manual |
| `clip` | Capturar texto da área de transferência |
| `gtd focus` | Iniciar uma sessão de foco, inspecionar status ou interromper |
| `gtd analytics` | Inspecionar durações de foco registradas |
| `gtd preferences` | Editar preferências do fluxo de trabalho |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

As preferências ficam em `~/Library/Preferences/com.alfredgtd.plist`; o estado de foco e os logs ficam em `~/.gtd`. As preferências contam com padrões integrados, verificações de tipo, importações validadas e gravações atômicas. As sessões de foco não alteram as configurações de notificação do sistema. O processamento da caixa de entrada abre a lista para revisão; ele não move nem conclui tarefas automaticamente.

Consulte o [guia do Alfred](../../../workflows/alfred/README.md) e a [documentação da biblioteca GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Adaptadores de captura externos

Todos os quatro fluxos de trabalho de captura por API são exercitados por meio de caixas de diálogo reais do Automator e uma fixture TLS local nos testes E2E hospedados. Uma suíte manual separada testa a persistência real nos fornecedores quando contas dedicadas estão configuradas. Things e OmniFocus exigem a suíte de integração de desktop licenciada.

| Destino | Mecanismo | Configuração / código-fonte |
| --- | --- | --- |
| Todoist | Captura via API | [Configuração de fluxo de trabalho e Keychain](../../../workflows/todoist/) |
| Notion | Captura via API de fonte de dados | [Configuração de fluxo de trabalho e Keychain](../../../workflows/notion/) |
| Things 3 | Esquema de URL | [Fluxo de trabalho](../../../workflows/things/) |
| OmniFocus | AppleScript / esquema de URL | [Fluxo de trabalho](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Fluxo de trabalho](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Fluxo de trabalho](../../../workflows/google/) |

Os adaptadores de API exigem configuração de credenciais; a Microsoft precisa de autorização OAuth delegada e o Google Keep precisa de acesso elegível ao Workspace:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Consulte [requisitos de configuração da API, migração e autorização](../../../workflows/api/README.md). Os IDs de banco de dados do Notion existentes são migrados apenas quando exatamente uma fonte de dados é encontrada. A captura da Microsoft e do Google usa APIs em vez de atalhos de navegador não documentados. Os tokens de acesso OAuth exigem renovação por meio do seu cliente OAuth. Os payloads usam chaves JSON explícitas, requisições HTTPS com tempo limitado e confirmação de resposta. As mensagens de erro preservam os detalhes da falha enquanto ocultam o token de API configurado. Consulte [SECURITY.md](../../../SECURITY.md) para relatar problemas de segurança.

### Barra de menus e Atalhos

O [guia da barra de menus](../../../workflows/menubar/README.md) aborda o plugin opcional do SwiftBar/xbar. Instale os Serviços da Apple primeiro, depois configure o diretório de plugins no aplicativo da barra de menus e crie um link para `workflows/menubar/gtd-menubar.sh` dentro dele.

O [guia do Atalhos](../../../workflows/shortcuts/README.md) fornece a configuração manual para captura por texto, área de transferência e Siri no macOS 12+. O app Atalhos e a ativação por voz da Siri estão fora da suíte de testes hospedada.

## Arquitetura

Os pacotes do Automator incorporam AppleScript para poderem ser executados como Serviços nativos. O Alfred empacota os scripts de ação e passa a entrada do usuário como argumentos. A GTDLib expõe operações nativas compartilhadas do Reminders a partir de código-fonte AppleScript editável e de um pacote de script compilado.

- **Um parser de produção:** `scripts/sync-native-parser.py` incorpora o parser compartilhado na Captura Rápida e na Captura de Eventos; a validação detecta divergências no código-fonte.
- **Estado de foco persistente:** invocações separadas compartilham o estado da sessão, com jobs do launchd próprios e contabilização limitada de tempo decorrido.
- **Pacotes reproduzíveis:** o empacotamento gera um arquivo compactado novo, e os testes comparam seu conteúdo com o código-fonte. A biblioteca possui um script de compilação separado.
- **Testes observáveis:** relatórios JUnit, logs de comandos e artefatos de compilação testados são retidos por 14 dias no GitHub Actions.

| Diretório | Responsabilidade |
| --- | --- |
| [`workflows/`](../../../workflows/) | Pacotes nativos, adaptadores de provedores, Alfred, Atalhos e scripts da barra de menus |
| [`scripts/`](../../../scripts/) | Empacotamento, compilação de biblioteca, sincronização do parser e provisionamento de testes hospedados |
| [`tests/`](../../../tests/) | Validação, verificações de componentes e E2E nativo de desktop |
| [`.github/workflows/`](../../../.github/workflows/) | CI, E2E noturno/manual e manutenção do repositório |
| [`infra/`](../../../infra/) | Configuração opcional de runner Mac local e EC2; o CI hospedado não a exige |

<a name="testing-and-compatibility"></a>

## Testes e compatibilidade

| Escopo | Ambiente | O que é verificado |
| --- | --- | --- |
| Validação | macOS 15 e 26 hospedados no GitHub | Compilação AppleScript, pacotes, parser de produção, destinos de ação, preferências, estado de foco, transporte de API com fixture e ida e volta de empacotamento |
| Verificações de segurança | Ubuntu e macOS 15 hospedados no GitHub | CodeQL para Python, ShellCheck e fuzzing limitado com Atheris no parser de produção compilado |
| E2E de adaptadores de provedores | `macos-15-intel` hospedado no GitHub | Todas as quatro caixas de diálogo de API de produção, transporte TLS, persistência/leitura de volta na fixture, falhas de API, cancelamento e seleção de fonte do Notion |
| E2E de provedores reais | Execução manual em Mac hospedado no GitHub com segredos dedicados | Captura real e leitura de volta nos fornecedores Todoist, Notion, Microsoft e Google; falha se faltarem contas |
| Integrações de desktop licenciadas | Conta local dedicada | Invocação de UI e persistência do Things 3, OmniFocus 4 e Alfred |
| E2E nativo de desktop | `macos-15-intel` hospedado no GitHub | Caixas de diálogo reais do Automator; dados persistidos no Reminders e Calendar; revisão semanal; contagens de menu; GTDLib compilada; ações nativas empacotadas do Alfred; expiração e cancelamento reais de timer do launchd |
| UI opcional do Alfred | Conta local dedicada, Alfred 5 + Powerpack | Importação de fluxo de trabalho, invocação por palavra-chave e leitura de volta de lembretes pela UI licenciada |

A [execução verificada de modernização de API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) aprovou **35 testes de validação em cada plataforma de validação e 26 testes E2E de desktop**, sem falhas, erros ou testes ignorados. A cobertura de desktop inclui 15 testes nativos e 11 testes de adaptadores de provedores, incluindo verificações reais de timeout de transporte e Keychain transitório. A validação também executa verificações de estrutura do repositório. Esses resultados cobrem o comportamento nativo e as fixtures de provedores; eles não comprovam compatibilidade com fornecedores em ambiente real ou aplicativos licenciados. O status atual é exibido pelos badges acima.

Pull requests e pushes para `main` executam a validação seguida pelo E2E nativo. O fluxo de trabalho E2E também é executado todas as noites e sob acionamento manual, incluindo testes determinísticos de adaptadores de provedores. Testes em fornecedores reais usam o fluxo de trabalho manual separado `live-e2e.yml`. O CI padrão usa Macs descartáveis hospedados no GitHub, fixtures isoladas e subprocessos limitados; nenhum runner auto-hospedado ou credenciais de contas externas são necessários para a suíte padrão. A suíte manual em ambiente real requer segredos dedicados dos provedores.

Versões anteriores do macOS não são validadas pelo CI atual. Execuções em provedores reais requerem segredos dedicados e ainda não foram verificadas. Atalhos/Siri e aplicativos de desktop licenciados estão fora da suíte hospedada padrão. Os testes de ações nativas exercitam diretamente os scripts empacotados do Alfred; eles não comprovam compatibilidade total com a UI do Alfred. Consulte [configuração de testes, pré-requisitos e cobertura](../../../tests/e2e/README.md).

## Localização

As strings voltadas ao usuário da CLI, do executor de testes e da barra de menus vêm em 45 localidades (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) em `locales/` via `scripts/i18n.py` sem nenhuma dependência de terceiros. A resolução de localidade verifica `--lang`, depois `LC_ALL`, `LC_MESSAGES` e `LANG`, usando `en` como fallback.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Desenvolvimento

Instale o [mise](https://mise.jdx.dev/) e use a versão do Python fixada em `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

A validação grava relatórios em `test-results/`; os scripts de compilação gravam em `dist/`. Para executar a suíte de desktop hospedada em `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

O E2E de desktop local requer uma conta de teste dedicada com sessão iniciada e as permissões descritas no [guia de E2E](../../../tests/e2e/README.md). O script hospedado de provisionamento de permissões é restrito a jobs descartáveis hospedados no GitHub.

Use [Conventional Commits](https://www.conventionalcommits.org/) e siga [CONTRIBUTING.md](../../../CONTRIBUTING.md). As alterações recentes estão registradas em [CHANGELOG.md](../../../CHANGELOG.md).

Os controles de segurança, a verificação de assinatura de lançamentos e as limitações restantes do Scorecard estão documentados na [avaliação de segurança](../../../docs/security-assessment.md). O fluxo de trabalho de lançamento compila e atesta os pacotes antes de criar um rascunho de lançamento, incluindo proveniência in-toto assinada e pacotes Sigstore verificados em relação ao commit e à ref de origem. A nova proveniência se aplica a essas compilações do fluxo de trabalho, não a downloads mais antigos.

## Histórico do projeto e licença

O MacGTD consolida os antigos repositórios MacGTD-Native, MacGTD-Microsoft, MacGTD-Google e AlfredGTD. Ele é licenciado sob a [Licença MIT](../../../LICENSE).
