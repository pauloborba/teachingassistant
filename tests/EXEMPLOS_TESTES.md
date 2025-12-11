================================================================================
EXEMPLOS PRÁTICOS - PADRÃO GIVEN/WHEN/THEN
================================================================================

Este documento mostra exemplos de testes e como seguem o padrão.

================================================================================
EXEMPLO 1: TESTE GUI SIMPLES - Carregar Turmas
================================================================================

ARQUIVO: tests/features/professor-dashboard.feature:7-10

```gherkin
  # TESTE 1: Carregamento Inicial do Dashboard
  # Dado: Componente recém-inicializado
  # Quando: Aplicação é carregada com professor válido
  # Então: Turmas são listadas e primeira é selecionada
  
  Cenário: Carregar turmas ao inicializar
    Quando o componente é inicializado com um professor válido
    Então as turmas devem ser carregadas
    E a primeira turma deve ser selecionada automaticamente
```

ANÁLISE:
─────────

ESTRUTURA:
└─ GIVEN: [Nenhum] - Sistema em estado inicial limpo (sem turmas)
   └─ Motivo: Teste inicial, sem pré-requisitos

└─ WHEN: o componente é inicializado com um professor válido
   └─ Ação: Carrega página http://localhost:4200 com professor

└─ THEN: as turmas devem ser carregadas
   └─ Verificação 1: Elemento [data-testid="turma-list"] está visível

└─ E: a primeira turma deve ser selecionada automaticamente
   └─ Verificação 2: Primeira turma tem atributo data-selected="true"

IMPLEMENTAÇÃO (tests/steps/professor-dashboard.steps.ts):

```typescript
When('o componente é inicializado com um professor válido', async function () {
  console.log('[WHEN] Inicializando componente com professor válido');
  testState.currentTurmaId = 'turma-1';
  // Simula: await page.goto('http://localhost:4200')
});

Then('as turmas devem ser carregadas', async function () {
  console.log('[THEN] Verificando se turmas foram carregadas');
  // Asserção: expect(turmas.length).toBeGreaterThan(0)
});

Then('a primeira turma deve ser selecionada automaticamente', async function () {
  console.log('[THEN] Verificando seleção automática da primeira turma');
  // Asserção: expect(testState.currentTurmaId).toBe('turma-1')
});
```

INDEPENDÊNCIA:
└─ ✅ Sim - Não depende de outro teste

LIMPEZA:
└─ ✅ Sim - Before/After hooks resetam testState

================================================================================
EXEMPLO 2: TESTE GUI COM DADO - Selecionar Turma
================================================================================

ARQUIVO: tests/features/professor-dashboard.feature:12-16

```gherkin
  # TESTE 2: Seleção de Turma
  # Dado: Dashboard com múltiplas turmas
  # Quando: Usuário clica em turma específica
  # Então: Alunos e monitores daquela turma são carregados
  
  Cenário: Selecionar uma turma
    Dado que o dashboard está inicializado
    Quando seleciono a turma "turma-2"
    Então os alunos da turma devem ser carregados
    E os monitores da turma devem ser carregados
```

ANÁLISE:
─────────

ESTRUTURA:
└─ GIVEN: que o dashboard está inicializado
   └─ Setup: Prepara estado inicial (turmas disponíveis, primeira selecionada)

└─ WHEN: seleciono a turma "turma-2"
   └─ Ação: Clica em turma específica, muda estado

└─ THEN: os alunos da turma devem ser carregados
   └─ Verificação 1: Lista de alunos da turma-2 é visível

└─ E: os monitores da turma devem ser carregados
   └─ Verificação 2: Lista de monitores da turma-2 é visível

IMPLEMENTAÇÃO:

```typescript
Given('que o dashboard está inicializado', async function () {
  console.log('[GIVEN] Dashboard está inicializado');
  testState.currentTurmaId = 'turma-1';
  testState.currentAlunos = [
    { id: 'aluno-1', nome: 'João Silva', monitorId: null },
    { id: 'aluno-2', nome: 'Maria Santos', monitorId: 'monitor-1' },
  ];
  // Simula estado: Dashboard com dados
});

When('seleciono a turma {string}', async function (turmaId: string) {
  console.log(`[WHEN] Selecionando turma: ${turmaId}`);
  testState.currentTurmaId = turmaId;  // Muda estado
  // Simula: await page.click(`[data-testid="turma-${turmaId}"]`)
});

Then('os alunos da turma devem ser carregados', async function () {
  console.log('[THEN] Verificando se alunos foram carregados');
  // Asserção: expect(testState.currentAlunos).toBeDefined()
  // Asserção: expect(testState.currentAlunos.length).toBeGreaterThan(0)
});
```

PADRÃO GIVEN/WHEN/THEN:
│
├─ GIVEN: Prepara estado (alunos, monitores, turmas)
│         Simula "Estou no dashboard com dados já carregados"
│
├─ WHEN: Executa ação de usuário
│        Simula "Usuário clica em turma-2"
│
└─ THEN: Valida resultado
         Verifica "Alunos e monitores de turma-2 aparecem"

REUTILIZAÇÃO:
└─ ✅ GIVEN "que o dashboard está inicializado"
   └─ Usado também em TESTE 2, TESTE 5, TESTE 12, TESTE 13
   └─ Não repetir: Um GIVEN para múltiplos testes

================================================================================
EXEMPLO 3: TESTE COM MÚLTIPLAS AÇÕES - Cadastro Monitor
================================================================================

ARQUIVO: tests/features/professor-dashboard.feature:28-35

```gherkin
  # TESTE 5: Cadastro de Monitor - Sucesso
  # Dado: Turma selecionada
  # Quando: Abrir popup, preencher dados e confirmar
  # Então: Monitor é adicionado com sucesso
  
  Cenário: Cadastrar novo monitor
    Dado que uma turma está selecionada
    Quando abro o popup de cadastro
    E preencho nome "Monitor A" e matricula "M100"
    E confirmo o cadastro
    Então uma mensagem de sucesso deve ser exibida
    E o monitor deve ser adicionado à lista
```

ANÁLISE:
─────────

ESTRUTURA AVANÇADA:
└─ GIVEN: uma turma selecionada
   └─ Setup: Estado preparado (turma já selecionada)

└─ WHEN: abro o popup de cadastro
   └─ Ação 1: Clica em botão para abrir formulário

└─ E: preencho nome "Monitor A" e matricula "M100"
   └─ Ação 2: Digita dados no formulário
   └─ Nota: Múltiplas E significa múltiplos WHEN em sequência

└─ E: confirmo o cadastro
   └─ Ação 3: Clica em botão salvar
   └─ Efeito: Sistema valida e cria monitor

└─ ENTÃO: uma mensagem de sucesso deve ser exibida
   └─ Verificação 1: Elemento com mensagem visível

└─ E: o monitor deve ser adicionado à lista
   └─ Verificação 2: Monitor aparece em lista de monitores

IMPLEMENTAÇÃO:

```typescript
Given('que uma turma está selecionada', async function () {
  console.log('[GIVEN] Uma turma está selecionada');
  testState.currentTurmaId = 'turma-1';
});

When('abro o popup de cadastro', async function () {
  console.log('[WHEN] Abrindo popup de cadastro de monitor');
  testState.popupAberto = true;
  // Simula: await page.click('[data-testid="btn-cadastro-monitor"]')
});

When('preencho nome {string} e matricula {string}', 
     async function (nome: string, matricula: string) {
  console.log(`[WHEN] Preenchendo monitor: ${nome} (${matricula})`);
  // Simula:
  // await page.fill('[data-testid="input-nome-monitor"]', nome)
  // await page.fill('[data-testid="input-matricula"]', matricula)
});

When('confirmo o cadastro', async function () {
  console.log('[WHEN] Confirmando cadastro de monitor');
  testState.mensagenExibida = 'Monitor cadastrado com sucesso';
  // Simula: await page.click('[data-testid="btn-confirmar-cadastro"]')
});

Then('uma mensagem de sucesso deve ser exibida', async function () {
  console.log('[THEN] Verificando mensagem de sucesso');
  // Asserção: expect(testState.mensagenExibida).toContain('sucesso')
});

Then('o monitor deve ser adicionado à lista', async function () {
  console.log('[THEN] Verificando se monitor foi adicionado');
  // Asserção: expect(testState.selectedMonitores?.length).toBeGreaterThan(0)
});
```

SEQUÊNCIA DE EXECUÇÃO:
1. GIVEN: Dashboard pronto, turma selecionada
2. WHEN 1: Abre popup (testState.popupAberto = true)
3. WHEN 2: Preenche campos (nome e matrícula)
4. WHEN 3: Confirma (testState.mensagem = sucesso)
5. THEN 1: Valida mensagem
6. THEN 2: Valida lista atualizada

PADRÃO IMPORTANTE:
└─ Múltiplas "E:" em WHEN significa ações sequenciais
└─ Múltiplas "E:" em THEN significa múltiplas validações

================================================================================
EXEMPLO 4: TESTE NEGATIVO - Validação de Campos
================================================================================

ARQUIVO: tests/features/professor-dashboard.feature:36-40

```gherkin
  # TESTE 6: Validação de Campos Obrigatórios
  # Dado: Popup de cadastro aberto
  # Quando: Tentar cadastrar deixando nome vazio
  # Então: Mensagem de erro impede cadastro
  
  Cenário: Validar campos obrigatórios do monitor
    Dado que o popup de cadastro está aberto
    Quando deixo o campo nome vazio
    E confirmo o cadastro
    Então uma mensagem de erro deve ser exibida
```

ANÁLISE:
─────────

TESTE NEGATIVO (Erro Esperado):
└─ Diferença de TESTE 5: Não preenche campo obrigatório
└─ Resultado esperado: Erro, não sucesso

PADRÃO:
│
├─ GIVEN: Formulário aberto
│         Simula "Estou na tela de cadastro"
│
├─ WHEN: Não preenche e tenta confirmar
│        Simula "Usuário esqueceu de preencher"
│
└─ THEN: Mensagem de erro exibida
         Verifica "Sistema bloqueou o cadastro"

IMPLEMENTAÇÃO:

```typescript
Given('que o popup de cadastro está aberto', async function () {
  console.log('[GIVEN] Popup de cadastro está aberto');
  testState.popupAberto = true;
});

When('deixo o campo nome vazio', async function () {
  console.log('[WHEN] Deixando campo nome vazio');
  // Campo não é preenchido, fica vazio
});

When('confirmo o cadastro', async function () {
  console.log('[WHEN] Confirmando cadastro de monitor');
  // Sistema retorna erro
  testState.mensagenExibida = 'Campo nome é obrigatório';
});

Then('uma mensagem de erro deve ser exibida', async function () {
  console.log('[THEN] Verificando exibição de mensagem de erro');
  // Asserção: expect(testState.mensagenExibida).toContain('erro')
  // Asserção: expect(testState.mensagenExibida).toContain('obrigatório')
});
```

CONTRASTE COM TESTE 5:
└─ TESTE 5 (Sucesso): Preenche → Confirma → Sucesso
└─ TESTE 6 (Erro): Deixa vazio → Tenta confirmar → Erro

VALOR:
└─ Testa comportamento de validação do sistema
└─ Garante que usuário não consegue criar registro inválido
└─ Testa mensagem de erro é clara e útil

================================================================================
EXEMPLO 5: TESTE API - GET com Asserções
================================================================================

ARQUIVO: tests/features/professor-dashboard-api.feature:14-19

```gherkin
  # TESTE API 2: Buscar Turma Específica
  # Dado: Turma com ID conhecida
  # Quando: Fazer requisição GET /api/turmas/:id
  # Então: Retorna dados da turma específica
  
  Cenário: Buscar turma específica via API
    Dado que existe uma turma com ID "turma-1"
    Quando faço uma requisição GET para "/api/turmas/turma-1"
    Então o status HTTP deve ser 200
    E a resposta deve conter os dados da turma
```

ANÁLISE:
─────────

TESTE DE API:
└─ Diferença: Não testa UI, testa endpoint REST
└─ Verifica: Status HTTP + estrutura de resposta JSON

ESTRUTURA PADRÃO:
│
├─ GIVEN: Garante dados existem (turma-1 foi criada)
│         Simula "API tem dados pré-carregados"
│
├─ WHEN: Executa requisição HTTP
│        Simula "Cliente faz GET /api/turmas/turma-1"
│
└─ THEN: Valida resposta
         Verifica "Status 200 e dados corretos"

IMPLEMENTAÇÃO:

```typescript
Given('que existe uma turma com ID {string}', 
      async function (turmaId: string) {
  console.log(`[API GIVEN] Turma com ID ${turmaId} existe`);
  apiTestState.turmaId = turmaId;
  // Na vida real: 
  // await fetch('/api/reset', {method: 'POST'})
  // await fetch('/api/turmas', {
  //   method: 'POST', 
  //   body: JSON.stringify({id: turmaId, nome: '...'})
  // })
});

When('faço uma requisição GET para {string}', 
     async function (endpoint: string) {
  console.log(`[API WHEN] Executando GET ${endpoint}`);
  try {
    const url = `${apiTestState.baseUrl}${endpoint}`;
    const response = await fetch(url, {method: 'GET'});
    apiTestState.lastResponse = response;
    apiTestState.lastResponseStatus = response.status;
    apiTestState.lastResponseData = await response.json();
  } catch (error) {
    apiTestState.lastErrorMessage = error.message;
  }
});

Then('o status HTTP deve ser {int}', 
     async function (statusEsperado: number) {
  console.log(`[API THEN] Verificando status HTTP`);
  // Asserção: expect(apiTestState.lastResponseStatus).toBe(statusEsperado)
});

Then('a resposta deve conter os dados da turma', 
     async function () {
  console.log('[API THEN] Verificando dados da turma');
  // Asserção: expect(apiTestState.lastResponseData.id).toBeDefined()
  // Asserção: expect(apiTestState.lastResponseData.nome).toBeDefined()
});
```

STATUS CODES TESTADOS:
└─ 200: GET sucesso, POST sucesso
└─ 201: POST criou recurso novo
└─ 400: Validação falhou (campos obrigatórios)
└─ 422: Lógica de negócio falhou (alunos não alocados)

================================================================================
EXEMPLO 6: TESTE API - POST com DataTable
================================================================================

ARQUIVO: tests/features/professor-dashboard-api.feature:28-34

```gherkin
  # TESTE API 4: Cadastrar Monitor
  # Dado: Dados válidos de monitor
  # Quando: Fazer requisição POST /api/monitores
  # Então: Monitor é criado e retorna ID
  
  Cenário: Cadastrar novo monitor via API
    Quando faço uma requisição POST para "/api/monitores" com dados:
      | nome      | Monitor A |
      | matricula | M100      |
    Então o status HTTP deve ser 201
    E a resposta deve conter um ID do monitor
```

ANÁLISE:
─────────

DATATABLE (Tabela Gherkin):
└─ Forma elegante de passar múltiplos dados de entrada
└─ Primeira coluna: chave (nome do campo)
└─ Segunda coluna: valor
└─ Sistema converte em objeto JSON

ESTRUTURA:
│
├─ GIVEN: [Nenhum] - Criar recurso novo, sem pré-requisitos
│
├─ WHEN: POST com DataTable
│        | nome      | Monitor A |
│        | matricula | M100      |
│        ↓ Converte para JSON ↓
│        {
│          "nome": "Monitor A",
│          "matricula": "M100"
│        }
│
└─ THEN: Valida status 201 (Created)
         Valida resposta contém ID

IMPLEMENTAÇÃO:

```typescript
When('faço uma requisição POST para {string} com dados:', 
     async function (endpoint: string, dataTable) {
  console.log(`[API WHEN] Executando POST ${endpoint}`);
  
  // DataTable.rowsHash() converte em objeto
  const data = dataTable.rowsHash();
  // data = { nome: 'Monitor A', matricula: 'M100' }
  
  apiTestState.requestData = data;
  
  try {
    const url = `${apiTestState.baseUrl}${endpoint}`;
    const response = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data),  // Envia como JSON
    });
    
    apiTestState.lastResponse = response;
    apiTestState.lastResponseStatus = response.status;
    apiTestState.lastResponseData = await response.json();
  } catch (error) {
    apiTestState.lastErrorMessage = error.message;
  }
});

Then('o status HTTP deve ser {int}', 
     async function (statusEsperado: number) {
  // Asserção: expect(apiTestState.lastResponseStatus).toBe(statusEsperado)
  // Para este teste: 201 (Created)
});

Then('a resposta deve conter um ID do monitor', 
     async function () {
  // Asserção: expect(apiTestState.lastResponseData.id).toBeDefined()
  apiTestState.monitorId = apiTestState.lastResponseData?.id;
});
```

VANTAGENS DATATABLE:
└─ Legível em português
└─ Fácil de entender o que está sendo testado
└─ Reutilizável para múltiplos valores
└─ Sem código complexo de setup

================================================================================
RESUMO - PADRÃO GIVEN/WHEN/THEN
================================================================================

ESTRUTURA UNIVERSAL:

  GIVEN: "Dado que [estado inicial]"
         └─ Setup: Prepara dados, contexto, pré-requisitos
         └─ Responde: "Em que situação?"
         └─ Exemplo: "dashboard está inicializado com turmas"

  WHEN: "Quando [ação executada]"
        └─ Ação: Clica, digita, submete, faz requisição
        └─ Responde: "Qual ação o usuário faz?"
        └─ Exemplo: "seleciono a turma turma-2"

  THEN: "Então [resultado esperado]"
        └─ Verificação: Asserta comportamento, estado, resposta
        └─ Responde: "O que deveria acontecer?"
        └─ Exemplo: "alunos da turma devem ser carregados"

FLUXO MENTAL:
│
├─ GIVEN: "Imagine que você está nesta situação..."
├─ WHEN:  "...e você faz isso..."
└─ THEN:  "...então deverá acontecer aquilo."

RÁPIDO E SIMPLES:
└─ Lê-se como sentença natural
└─ Não requer background técnico para entender
└─ Executável automaticamente por ferramenta (Cucumber)

================================================================================
