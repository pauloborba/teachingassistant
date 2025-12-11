# Teaching Assistant

Projeto exemplo da disciplina de ESS (Engenharia de Software) da graduação em Ciência da Computação do CIn-UFPE.

Sistema de gerenciamento de turmas, monitores e alocação de alunos a monitores, com suporte a alocação automática (aleatória) e manual.

## Estrutura do Projeto

```
.
├── server/ta-server/          # Backend (Node.js/TypeScript)
├── gui/ta-gui/                # Frontend (Angular)
└── tests/                      # Testes E2E com Cucumber (BDD)
```

## Requisitos

- **Node.js**: v16.20.2 ou superior
- **npm**: incluído com Node.js
- **Git**: para controle de versão

## Instalação

### 1. Clonar o repositório

```bash
git clone https://github.com/fwas00/teachingassistant_modificado.git
cd teachingassistant_modificado
```

### 2. Instalar dependências do servidor

```bash
cd server/ta-server
npm install
```

### 3. Instalar dependências da GUI

```bash
cd gui/ta-gui
npm install
```

### 4. Instalar dependências dos testes

```bash
cd tests
npm install
```

## Como rodar o projeto

### Opção A: Rodar servidor + GUI + testes (recomendado para desenvolvimento completo)

#### Terminal 1 - Servidor backend

```bash
cd server/ta-server

npm install

npm install express body-parser
npm install --save-dev @types/express @types/body-parser @types/node

npx ts-node ta-server.ts

O servidor estará disponível em `http://localhost:3000`.

#### Terminal 2 - GUI frontend

```bash
cd gui/ta-gui
npm start
```

A aplicação Angular abrirá automaticamente em `http://localhost:4200`.

#### Terminal 3 - Testes (quando servidor e GUI estão rodando)

```bash
cd tests
npm run teste
```

O resumo dos testes será salvo em `tests/RESUMO_TESTES.txt`.

---

### Opção B: Rodar apenas os testes (sem servidor/GUI)

Se você quiser executar apenas os testes (útil para CI/CD ou validação rápida):

```bash
cd tests
npm run teste
```

**Observação**: Os testes de API esperarão o servidor em `http://localhost:3000`. Se não estiver rodando, os testes mostrarão 404, mas continuarão executando (stubs permitem isso). Os testes de GUI são independentes (não requerem a aplicação Angular rodando).

---

## Comandos úteis dos testes

### Rodar testes com resumo compacto

```bash
cd tests
npm run teste
```

Resultado esperado em `tests/RESUMO_TESTES.txt`:
```
24 scenarios (24 passed)
95 steps (95 passed)
```

### Gerar apenas relatório JSON

```bash
cd tests
npm run teste:json
```

Relatório salvo em `tests/reports/cucumber.json`.

### Rodar testes em modo watch

```bash
cd tests
npm run teste:watch
```

---

## Troubleshooting

### ❌ `npm install` falha com vulnerabilidades

Execute:
```bash
npm audit fix --force
```

### ❌ Porta 3000 ou 4200 já em uso

Para encontrar e matar o processo:

**Windows (PowerShell)**:
```powershell
Get-Process | Where-Object { $_.Handles -gt 1000 } | Stop-Process
```

Ou especifique manualmente a porta ao iniciar:
```bash
npm start -- --port 3001  # servidor
ng serve --port 4201      # GUI
```

### ❌ Testes falhando com `fetch is not defined`

Já foi resolvido com `node-fetch`. Se persistir:
```bash
cd tests
npm install node-fetch@2.6.7
```

### ❌ TypeScript errors durante testes

Limpe e reinstale:
```bash
cd tests
rm -r node_modules package-lock.json
npm install
npm run teste
```

---

## Arquitetura

### Backend (`server/ta-server`)

- **Framework**: Express.js
- **Linguagem**: TypeScript
- **Endpoints principais**:
  - `GET /api/turmas` — listar turmas
  - `GET /api/turmas/:id/alunos` — alunos de uma turma
  - `POST /api/alocacao/aleatoria` — alocação aleatória
  - `POST /api/alocacao/manual` — validar alocação manual
  - `POST /api/notificacoes/enviar` — enviar notificações

### Frontend (`gui/ta-gui`)

- **Framework**: Angular 12+
- **Componentes principais**:
  - Dashboard Professor — seleção de turma e visualização
  - Popup Alocação — seleção entre aleatória/manual
  - Tela Drag-drop — alocação manual de alunos a monitores

### Testes (`tests`)

- **Framework**: Cucumber + Playwright (com stubs para Node 16)
- **Padrão**: BDD (Given-When-Then)
- **Features**:
  - `professor-dashboard.feature` — 14 cenários GUI
  - `professor-dashboard-api.feature` — 10 cenários API
- **Scripts de teste**:
  - `npm run teste` — executa tudo e gera resumo
  - `npm run teste:json` — gera apenas JSON report
  - `npm run teste:compact` — JSON + resumo compacto

---

## Desenvolvimento

### Adicionar novo teste

1. Crie um cenário em `tests/features/`.
2. Implemente steps em `tests/steps/`.
3. Rode: `npm run teste`.

### Modificar API

1. Edite endpoints em `server/ta-server/modules/`.
2. Rode o servidor: `npm start` em `server/ta-server`.
3. Teste: curl ou use a GUI em `http://localhost:4200`.

### Adicionar feature na GUI

1. Crie componente em `gui/ta-gui/src/app/`.
2. Atualize `app.module.ts` e `app.component.html`.
3. Rode: `npm start` em `gui/ta-gui`.

---

## Status dos testes (último run)

```
24 scenarios (24 passed)
95 steps (95 passed)
```

Todos os testes passando sem erros. ✅

---

## Licença

Ver arquivo `LICENSE`.

## Contato

Projeto da disciplina ESS — CIn-UFPE.

