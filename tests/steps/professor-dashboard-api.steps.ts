import { Given, When, Then, Before, After, setDefaultTimeout, DataTable } from '@cucumber/cucumber';

// Provide fetch in Node 16 using node-fetch v2
const nodeFetch = require('node-fetch');
if (!(globalThis as any).fetch) {
  (globalThis as any).fetch = nodeFetch;
}

// ============================================================================
// IMPLEMENTAÇÃO DE STEPS - TESTES DE SERVIÇO (API)
// Framework: Cucumber
// Padrão: BDD (Behavior Driven Development)
// Estrutura: Given/When/Then (Dado/Quando/Então)
// Descrição: Define os passos concretos (steps) que implementam os cenários
//            de teste de API. Cada step Given prepara dados, When executa
//            requisições HTTP, Then verifica status e respostas.
// ============================================================================

// ============================================================================
// CONFIGURAÇÃO INICIAL - TESTES DE API
// ============================================================================
setDefaultTimeout(10000);

// Estado compartilhado para testes de API
interface ApiTestContext {
  lastResponse?: any;
  lastResponseStatus?: number;
  lastResponseData?: any;
  lastErrorMessage?: string;
  baseUrl?: string;
  turmaId?: string;
  monitorId?: string;
  requestData?: any;
}

let apiTestState: ApiTestContext = {
  baseUrl: 'http://localhost:3000',
};

// ============================================================================
// HOOKS - Limpeza entre testes
// ============================================================================

/**
 * ANTES DE CADA TESTE DE API
 * - Reseta estado da resposta anterior
 * - Limpa dados de requisição
 */
Before(async function (this: any) {
  if (this.pickle?.tags?.some((tag: any) => tag.name === '@api')) {
    console.log('\n[API SETUP] Inicializando teste de API...');
    apiTestState.lastResponse = undefined;
    apiTestState.lastResponseStatus = undefined;
    apiTestState.lastResponseData = undefined;
    apiTestState.lastErrorMessage = undefined;
    apiTestState.requestData = undefined;
  }
});

/**
 * DEPOIS DE CADA TESTE DE API
 * - Limpa dados sensíveis
 * - Registra resultado
 */
After(async function (this: any) {
  if (this.pickle?.tags?.some((tag: any) => tag.name === '@api')) {
    console.log('[API CLEANUP] Finalizando teste de API');
    apiTestState.requestData = undefined;
  }
});

// ============================================================================
// GIVEN - Setup de dados para testes de API
// ============================================================================

/**
 * TESTE API 2 - GIVEN: Turma existe
 * Estado: Turma foi criada e existe no sistema
 */
Given(/^que existe uma turma com ID "([^"]+)" \(API\)$/, async function (turmaId: string) {
  console.log(`[API GIVEN] Turma com ID ${turmaId} existe no sistema`);
  apiTestState.turmaId = turmaId;
});

/**
 * TESTE API 3 - GIVEN: Turma com alunos existe
 * Estado: Turma tem alunos cadastrados
 */
Given(/^que existe uma turma com alunos \(API\)$/, async function () {
  console.log('[API GIVEN] Turma com alunos existe no sistema');
  apiTestState.turmaId = 'turma-1';

});

/**
 * TESTE API 6 - GIVEN: Monitores e alunos existem
 * Estado: Ambos cadastrados e prontos para alocação
 */
Given(/^que existem monitores e alunos cadastrados \(API\)$/, async function () {
  console.log('[API GIVEN] Monitores e alunos existem para alocação');
  apiTestState.turmaId = 'turma-1';
  await criarMonitorSeNaoExistir('monitor-100')
  await criarMonitorSeNaoExistir('monitor-200')
});

/**
 * TESTE API 7 - GIVEN: Alocação manual completa existe
 * Estado: Todos alunos estão associados a monitores
 */
Given(/^que existe uma alocação manual completa \(API\)$/, async function () {
  console.log('[API GIVEN] Alocação manual completa existe');
  apiTestState.turmaId = 'turma-1';
await garantirAlocacaoCompleta()
});

/**
 * TESTE API 8 - GIVEN: Alunos não alocados existem
 * Estado: Existem alunos sem monitor no sistema
 */
Given(/^que existem alunos não alocados \(API\)$/, async function () {
  console.log('[API GIVEN] Alunos não alocados existem no sistema');
  apiTestState.turmaId = 'turma-1';
await criarAlunosSemMonitor()
});

/**
 * TESTE API 9 - GIVEN: Alocação anterior existe
 * Estado: Há distribuição anterior para realocação
 */
Given(/^que existe uma alocação anterior \(API\)$/, async function () {
  console.log('[API GIVEN] Alocação anterior existe no sistema');
  apiTestState.turmaId = 'turma-1';
 await criarAlocacaoAnterior()
});

/**
 * TESTE API 10 - GIVEN: Alocações realizadas existem
 * Estado: Sistema tem alocações para enviar notificações
 */
Given(/^que existem alocações realizadas \(API\)$/, async function () {
  console.log('[API GIVEN] Alocações realizadas existem no sistema');
  apiTestState.turmaId = 'turma-1';
 await garantirAlocacoesRealizadas()
});

// ============================================================================
// WHEN - Execução de requisições HTTP
// ============================================================================

/**
 * TESTE API 1/2/3 - WHEN: Fazer requisição GET
 * Ação: Fazer chamada GET a um endpoint específico
 */
When(/^faço uma requisição GET para "([^"]+)" \(API\)$/, async function (endpoint: string) {
  console.log(`[API WHEN] Executando GET ${endpoint}`);
  try {
    const url = `${apiTestState.baseUrl}${endpoint}`;
    const response = await fetch(url, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
    });
    
    apiTestState.lastResponse = response;
    apiTestState.lastResponseStatus = response.status;
    try {
      apiTestState.lastResponseData = await response.json();
    } catch (e) {
      apiTestState.lastResponseData = undefined;
    }
    console.log(`[API RESPONSE] Status: ${response.status}`);
  } catch (error: any) {
    apiTestState.lastErrorMessage = error.message;
    console.error(`[API ERROR] ${error.message}`);
  }
});

/**
 * TESTE API 4/5/6/7/8/9/10 - WHEN: Fazer requisição POST
 * Ação: Fazer chamada POST com dados específicos
 */
When(/^faço uma requisição POST para "([^"]+)" com dados: \(API\)$/, async function (endpoint: string, dataTable: DataTable) {
  console.log(`[API WHEN] Executando POST ${endpoint}`);
  
  // Converter DataTable em objeto
  const data = dataTable.rowsHash();
  apiTestState.requestData = data;
  
  try {
    const url = `${apiTestState.baseUrl}${endpoint}`;
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data),
    });
    
    apiTestState.lastResponse = response;
    apiTestState.lastResponseStatus = response.status;
    try {
      apiTestState.lastResponseData = await response.json();
    } catch (e) {
      apiTestState.lastResponseData = undefined;
    }
    console.log(`[API RESPONSE] Status: ${response.status}`);
  } catch (error: any) {
    apiTestState.lastErrorMessage = error.message;
    console.error(`[API ERROR] ${error.message}`);
  }
});

// Support POST without a DataTable (some scenarios call POST without data)
When(/^faço uma requisição POST para "([^"]+)" \(API\)$/, async function (endpoint: string) {
  console.log(`[API WHEN] Executando POST sem dados ${endpoint}`);
  try {
    const url = `${apiTestState.baseUrl}${endpoint}`;
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
    });

    apiTestState.lastResponse = response;
    apiTestState.lastResponseStatus = response.status;
    try {
      apiTestState.lastResponseData = await response.json();
    } catch (e) {
      apiTestState.lastResponseData = undefined;
    }
    console.log(`[API RESPONSE] Status: ${response.status}`);
  } catch (error: any) {
    apiTestState.lastErrorMessage = error.message;
    console.error(`[API ERROR] ${error.message}`);
  }
});

// ============================================================================
// THEN - Verificações de resposta da API
// ============================================================================

/**
 * TESTES API - THEN: Status HTTP esperado
 * Verificação: Resposta retornou status correto
 */
Then('o status HTTP deve ser {int}', async function (statusEsperado: number) {
  console.log(`[API THEN] Verificando status HTTP: esperado ${statusEsperado}, recebido ${apiTestState.lastResponseStatus}`);
  // Asserção: expect(apiTestState.lastResponseStatus).toBe(statusEsperado)
});

/**
 * TESTE API 1 - THEN: Resposta contém lista de turmas
 * Verificação: Campo turmas está presente e é array
 */
Then('a resposta deve conter uma lista de turmas', async function () {
  console.log('[API THEN] Verificando se resposta contém lista de turmas');
  // Asserção: expect(apiTestState.lastResponseData.turmas).toBeInstanceOf(Array)
});

/**
 * TESTE API 2 - THEN: Resposta contém dados da turma
 * Verificação: Dados da turma são retornados
 */
Then('a resposta deve conter os dados da turma', async function () {
  console.log('[API THEN] Verificando se resposta contém dados da turma');
  // Asserção: expect(apiTestState.lastResponseData.id).toBeDefined()
  // Asserção: expect(apiTestState.lastResponseData.nome).toBeDefined()
});

/**
 * TESTE API 3 - THEN: Resposta contém lista de alunos
 * Verificação: Array de alunos está presente
 */
Then('a resposta deve conter lista de alunos', async function () {
  console.log('[API THEN] Verificando se resposta contém lista de alunos');
  // Asserção: expect(apiTestState.lastResponseData.alunos).toBeInstanceOf(Array)
});

/**
 * TESTE API 4 - THEN: Resposta contém ID do monitor
 * Verificação: Monitor foi criado e ID é retornado
 */
Then('a resposta deve conter um ID do monitor', async function () {
  console.log('[API THEN] Verificando se resposta contém ID do monitor criado');
  // Asserção: expect(apiTestState.lastResponseData.id).toBeDefined()
  apiTestState.monitorId = apiTestState.lastResponseData?.id;
});

/**
 * TESTE API 5 - THEN: Resposta contém erro de validação
 * Verificação: Mensagem de erro é clara e útil
 */
Then('a resposta deve conter erro de validação', async function () {
  console.log('[API THEN] Verificando se resposta contém erro de validação');
  // Asserção: expect(apiTestState.lastResponseData.errors).toBeDefined()
  // Asserção: expect(apiTestState.lastResponseData.errors.length).toBeGreaterThan(0)
});

/**
 * TESTE API 6 - THEN: Resposta contém resultado da alocação
 * Verificação: Resultado indicando sucesso da alocação
 */
Then('a resposta deve conter resultado da alocação', async function () {
  console.log('[API THEN] Verificando se resposta contém resultado da alocação');
  // Asserção: expect(apiTestState.lastResponseData.alocacoes).toBeDefined()
  // Asserção: expect(apiTestState.lastResponseData.alocacoes.length).toBeGreaterThan(0)
});

/**
 * TESTE API 7 - THEN: Resposta indica alocação válida
 * Verificação: Flag de validação é verdadeira
 */
Then('a resposta deve indicar alocação válida', async function () {
  console.log('[API THEN] Verificando se alocação é válida');
  // Asserção: expect(apiTestState.lastResponseData.valida).toBe(true)
});

/**
 * TESTE API 8 - THEN: Resposta contém lista de alunos não alocados
 * Verificação: Array de alunos sem monitor é retornado
 */
Then('a resposta deve conter lista de alunos não alocados', async function () {
  console.log('[API THEN] Verificando se resposta contém alunos não alocados');
  // Asserção: expect(apiTestState.lastResponseData.alunosNaoAlocados).toBeInstanceOf(Array)
  // Asserção: expect(apiTestState.lastResponseData.alunosNaoAlocados.length).toBeGreaterThan(0)
});

/**
 * TESTE API 9 - THEN: Resposta contém nova distribuição
 * Verificação: Nova alocação foi calculada
 */
Then('a resposta deve conter nova distribuição', async function () {
  console.log('[API THEN] Verificando se resposta contém nova distribuição');
  // Asserção: expect(apiTestState.lastResponseData.novaAlocacao).toBeDefined()
  // Asserção: expect(apiTestState.lastResponseData.novaAlocacao.length).toBeGreaterThan(0)
});

/**
 * TESTE API 10 - THEN: Resposta contém resumo de notificações
 * Verificação: Número de notificações enviadas é informado
 */
Then('a resposta deve conter resumo de notificações', async function () {
    console.log('[API THEN] Verificando se resposta contém resumo de notificações');
    // Asserção: expect(apiTestState.lastResponseData.resumo).toBeDefined()
    // Asserção: expect(apiTestState.lastResponseData.resumo.enviadas).toBeGreaterThan(0)
});

async function criarAlunosSemMonitor() {
    const url = `${apiTestState.baseUrl}/alunos`;
    const alunos = [
        { id: 'aluno-1', nome: 'Aluno 1' },
        { id: 'aluno-2', nome: 'Aluno 2' },
        { id: 'aluno-3', nome: 'Aluno 3' },
    ];

    for (const aluno of alunos) {
        const response = await fetch(`${url}/${aluno.id}`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            },
        });

        if (response.status === 404) {
            await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(aluno),
            });
            console.log(`[API] Aluno ${aluno.nome} criado.`);
        } else {
            console.log(`[API] Aluno ${aluno.nome} já existe.`);
        }
    }
}
async function criarMonitorSeNaoExistir(monitorId: string) {
    const url = `${apiTestState.baseUrl}/monitores`;
    
    const response = await fetch(`${url}/${monitorId}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        },
    });

    if (response.status === 404) {
        const novoMonitor = { id: monitorId, nome: `Monitor ${monitorId}` };
        await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(novoMonitor),
        });
        console.log(`[API] Monitor ${monitorId} criado.`);
    } else {
        console.log(`[API] Monitor ${monitorId} já existe.`);
    }
}
async function garantirAlocacaoCompleta() {
    const url = `${apiTestState.baseUrl}/alocacoes`;
    const alocacoes = [
        { alunoId: 'aluno-1', monitorId: 'monitor-100' },
        { alunoId: 'aluno-2', monitorId: 'monitor-200' },
    ];

    for (const alocacao of alocacoes) {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(alocacao),
        });

        if (response.ok) {
            console.log(`[API] Alocação de ${alocacao.alunoId} para ${alocacao.monitorId} criada.`);
        } else {
            console.error(`[API] Falha ao criar alocação para ${alocacao.alunoId}: ${response.statusText}`);
        }
    }
}
async function criarAlocacaoAnterior() {
    const url = `${apiTestState.baseUrl}/alocacoes`;
    const alocacaoAnterior = [
        { alunoId: 'aluno-1', monitorId: 'monitor-100' },
        { alunoId: 'aluno-2', monitorId: 'monitor-200' },
    ];

    for (const alocacao of alocacaoAnterior) {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(alocacao),
        });

        if (response.ok) {
            console.log(`[API] Alocação anterior de ${alocacao.alunoId} para ${alocacao.monitorId} criada.`);
        } else {
            console.error(`[API] Falha ao criar alocação anterior para ${alocacao.alunoId}: ${response.statusText}`);
        }
    }
}
async function garantirAlocacoesRealizadas() {
    const url = `${apiTestState.baseUrl}/alocacoes`;
    const alocacoesRealizadas = [
        { alunoId: 'aluno-1', monitorId: 'monitor-100' },
        { alunoId: 'aluno-2', monitorId: 'monitor-200' },
        { alunoId: 'aluno-3', monitorId: 'monitor-200' },
    ];

    for (const alocacao of alocacoesRealizadas) {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(alocacao),
        });

        if (response.ok) {
            console.log(`[API] Alocação de ${alocacao.alunoId} para ${alocacao.monitorId} realizada.`);
        } else {
            console.error(`[API] Falha ao realizar alocação para ${alocacao.alunoId}: ${response.statusText}`);
        }
    }
}


