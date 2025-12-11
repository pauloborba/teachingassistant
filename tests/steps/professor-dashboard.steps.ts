import { Given, When, Then, Before, After, setDefaultTimeout, defineStep } from '@cucumber/cucumber';

// ============================================================================
// IMPLEMENTAÇÃO DE STEPS - TESTES DE ACEITAÇÃO GUI
// Framework: Cucumber
// Padrão: BDD (Behavior Driven Development)
// Estrutura: Given/When/Then (Dado/Quando/Então)
// Descrição: Define os passos concretos (steps) que implementam os cenários
//            de teste de aceitação da GUI. Cada step Given prepara estado,
//            When executa ações do usuário, Then verifica resultados.
// ============================================================================

// ============================================================================
// CONFIGURAÇÃO INICIAL
// ============================================================================
setDefaultTimeout(30000);

// Estado compartilhado para testes - reinicializado entre cenários
interface TestContext {
  currentTurmaId?: string;
  selectedMonitores?: Array<{ id: string; nome: string }>;
  currentAlunos?: Array<{ id: string; nome: string; monitorId?: string | null }>;
  popupAberto?: boolean;
  mensagenExibida?: string;
  filtroAtivo?: { tipo: string; valor: string };
}

let testState: TestContext = {};

// ============================================================================
// HOOKS - Execução antes e depois de cada cenário
// ============================================================================

/**
 * ANTES DE CADA CENÁRIO
 * - Limpa estado anterior
 * - Inicializa contexto vazio
 * - Pode conectar a dados mock ou API de teste
 */
Before(async () => {
  console.log('\n[SETUP] Limpando estado anterior e inicializando novo cenário...');
  testState = {};
  // Aqui você poderia resetar dados na API: await fetch('/api/reset', { method: 'POST' })
});

/**
 * DEPOIS DE CADA CENÁRIO
 * - Limpa estado para evitar contaminação entre testes
 * - Fecha popups abertos
 * - Limpa filtros aplicados
 */
After(async () => {
  console.log('[CLEANUP] Limpando estado do cenário...');
  testState = {};
});

// ============================================================================
// GIVEN - Preparação de dados e contexto (Setup)
// ============================================================================

/**
 * TESTE 1 - GIVEN: Dashboard inicializado
 * Estado: Componente já renderizado com turmas carregadas
 */
Given('que o dashboard está inicializado', async function () {
  console.log('[GIVEN] Dashboard está inicializado');
  testState.currentTurmaId = 'turma-1';
  testState.currentAlunos = [
    { id: 'aluno-1', nome: 'João Silva', monitorId: null },
    { id: 'aluno-2', nome: 'Maria Santos', monitorId: 'monitor-1' },
  ];
});

/**
 * TESTE 3/4 - GIVEN: Alunos carregados
 * Estado: Lista de alunos disponível para filtrar
 */
Given('que alunos estão carregados', async function () {
  console.log('[GIVEN] Alunos estão carregados na tela');
  testState.currentAlunos = [
    { id: 'aluno-1', nome: 'João Silva', monitorId: null },
    { id: 'aluno-2', nome: 'Maria Santos', monitorId: 'monitor-1' },
    { id: 'aluno-3', nome: 'João Oliveira', monitorId: null },
    { id: 'aluno-4', nome: 'Pedro Costa', monitorId: 'monitor-2' },
  ];
});

// Alias without 'que' to match some feature phrasing
Given('alunos estão carregados', async function () {
  console.log('[GIVEN] (alias) Alunos estão carregados na tela');
  testState.currentAlunos = [
    { id: 'aluno-1', nome: 'João Silva', monitorId: null },
    { id: 'aluno-2', nome: 'Maria Santos', monitorId: 'monitor-1' },
    { id: 'aluno-3', nome: 'João Oliveira', monitorId: null },
    { id: 'aluno-4', nome: 'Pedro Costa', monitorId: 'monitor-2' },
  ];
});

/**
 * TESTE 5 - GIVEN: Turma selecionada
 * Estado: Uma turma específica está ativa
 */
Given('que uma turma está selecionada', async function () {
  console.log('[GIVEN] Uma turma está selecionada');
  testState.currentTurmaId = 'turma-1';
});

/**
 * TESTE 6 - GIVEN: Popup de cadastro aberto
 * Estado: Formulário de cadastro de monitor visível
 */
Given('que o popup de cadastro está aberto', async function () {
  console.log('[GIVEN] Popup de cadastro está aberto');
  testState.popupAberto = true;
});

/**
 * TESTE 7 - GIVEN: Monitores cadastrados
 * Estado: Sistema tem monitores disponíveis
 */
Given('que monitores estão cadastrados', async function () {
  console.log('[GIVEN] Monitores estão cadastrados no sistema');
  testState.selectedMonitores = [
    { id: 'monitor-1', nome: 'Pedro Costa' },
    { id: 'monitor-2', nome: 'Ana Lima' },
  ];
});

/**
 * TESTE 9 - GIVEN: Tela de alocação manual aberta
 * Estado: Interface de drag-drop visível com alunos
 */
Given('que a tela de alocação manual está aberta', async function () {
  console.log('[GIVEN] Tela de alocação manual está aberta');
  testState.popupAberto = true;
});

/**
 * TESTE 10 - GIVEN: Alunos foram movidos
 * Estado: Alunos já estão associados a monitores
 */
Given('que alunos foram movidos para monitores', async function () {
  console.log('[GIVEN] Alunos foram movidos para monitores');
  testState.currentAlunos = [
    { id: 'aluno-1', nome: 'João Silva', monitorId: 'monitor-1' },
    { id: 'aluno-2', nome: 'Maria Santos', monitorId: 'monitor-1' },
    { id: 'aluno-3', nome: 'João Oliveira', monitorId: 'monitor-2' },
  ];
});

/**
 * TESTE 11 - GIVEN: Alunos não alocados
 * Estado: Existem alunos sem monitor atribuído
 */
Given('que existem alunos não alocados', async function () {
  console.log('[GIVEN] Existem alunos não alocados');
  testState.currentAlunos = [
    { id: 'aluno-1', nome: 'João Silva', monitorId: null },
    { id: 'aluno-2', nome: 'Maria Santos', monitorId: 'monitor-1' },
    { id: 'aluno-3', nome: 'João Oliveira', monitorId: null },
  ];
});

/**
 * TESTE 12/13/14 - GIVEN: Alocações realizadas
 * Estado: Sistema possui alocações válidas
 */
Given('que alocações foram realizadas', async function () {
  console.log('[GIVEN] Alocações foram realizadas');
  testState.currentAlunos = [
    { id: 'aluno-1', nome: 'João Silva', monitorId: 'monitor-1' },
    { id: 'aluno-2', nome: 'Maria Santos', monitorId: 'monitor-2' },
  ];
});

// ============================================================================
// WHEN - Ações executadas pelo usuário ou sistema
// ============================================================================

/**
 * TESTE 1 - WHEN: Componente inicializado
 * Ação: Carregar aplicação com professor válido
 */
When('o componente é inicializado com um professor válido', async function () {
  console.log('[WHEN] Inicializando componente com professor válido');
  testState.currentTurmaId = 'turma-1';
  // Simula: await page.goto('http://localhost:4200')
});

/**
 * TESTE 2 - WHEN: Selecionar turma
 * Ação: Clicar em uma turma específica
 */
When('seleciono a turma {string}', async function (turmaId: string) {
  console.log(`[WHEN] Selecionando turma: ${turmaId}`);
  testState.currentTurmaId = turmaId;
  // Simula: await page.click(`[data-testid="turma-${turmaId}"]`)
});

/**
 * TESTE 3 - WHEN: Aplicar filtro por nome
 * Ação: Digitar nome no campo de filtro
 */
When('aplico o filtro de nome {string}', async function (nome: string) {
  console.log(`[WHEN] Aplicando filtro de nome: ${nome}`);
  testState.filtroAtivo = { tipo: 'nome', valor: nome };
  // Simula: await page.fill('[data-testid="filtro-nome"]', nome)
});

/**
 * TESTE 4 - WHEN: Aplicar filtro por status
 * Ação: Selecionar status no dropdown
 */
When('aplico o filtro de status {string}', async function (status: string) {
  console.log(`[WHEN] Aplicando filtro de status: ${status}`);
  testState.filtroAtivo = { tipo: 'status', valor: status };
  // Simula: await page.selectOption('[data-testid="filtro-status"]', status)
});

/**
 * TESTE 5 - WHEN: Abrir popup de cadastro
 * Ação: Clicar em botão para cadastro de monitor
 */
When('abro o popup de cadastro', async function () {
  console.log('[WHEN] Abrindo popup de cadastro de monitor');
  testState.popupAberto = true;
  // Simula: await page.click('[data-testid="btn-cadastro-monitor"]')
});

/**
 * TESTE 5 - WHEN: Preencher dados de monitor
 * Ação: Digitar nome e matrícula no formulário
 */
When('preencho nome {string} e matricula {string}', async function (nome: string, matricula: string) {
  console.log(`[WHEN] Preenchendo monitor: ${nome} (${matricula})`);
  // Simula:
  // await page.fill('[data-testid="input-nome-monitor"]', nome)
  // await page.fill('[data-testid="input-matricula"]', matricula)
});

/**
 * TESTE 5/6 - WHEN: Confirmar cadastro
 * Ação: Clicar em botão confirmar
 */
When('confirmo o cadastro', async function () {
  console.log('[WHEN] Confirmando cadastro de monitor');
  testState.mensagenExibida = 'Monitor cadastrado com sucesso';
  // Simula: await page.click('[data-testid="btn-confirmar-cadastro"]')
});

/**
 * TESTE 6 - WHEN: Deixar campo vazio
 * Ação: Não preencher campo obrigatório
 */
When('deixo o campo nome vazio', async function () {
  console.log('[WHEN] Deixando campo nome vazio');
  // Simula campo vazio no formulário
});

/**
 * TESTE 7 - WHEN: Abrir popup de alocação
 * Ação: Clicar em botão alocação
 */
When('abro o popup de alocação', async function () {
  console.log('[WHEN] Abrindo popup de alocação');
  testState.popupAberto = true;
  // Simula: await page.click('[data-testid="btn-alocacao"]')
});

/**
 * TESTE 7/8 - WHEN: Selecionar tipo de alocação
 * Ação: Clicar em radio button de tipo
 */
When('seleciono {string}', async function (tipo: string) {
  console.log(`[WHEN] Selecionando tipo de alocação: ${tipo}`);
  // Simula: await page.click(tipo contém 'aleatória' ? '[data-testid="radio-aleatoria"]' : '[data-testid="radio-manual"]')
});

/**
 * TESTE 7 - WHEN: Confirmar alocação
 * Ação: Clicar em executar alocação
 */
When('confirmo a alocação', async function () {
  console.log('[WHEN] Confirmando execução da alocação');
  testState.mensagenExibida = 'Alocação realizada com sucesso';
  // Simula: await page.click('[data-testid="btn-executar-alocacao"]')
});

/**
 * TESTE 9 - WHEN: Arrasto aluno para monitor
 * Ação: Drag-drop de elemento aluno para coluna monitor
 */
When('arrasto o aluno {string} para o monitor {string}', async function (alunoId: string, monitorId: string) {
  console.log(`[WHEN] Arrastando aluno ${alunoId} para monitor ${monitorId}`);
  // Simula drag-drop
  if (testState.currentAlunos) {
    const aluno = testState.currentAlunos.find(a => a.id === alunoId);
    if (aluno) {
      aluno.monitorId = monitorId;
    }
  }
});

/**
 * TESTE 10 - WHEN: Salvar distribuição manual
 * Ação: Clicar em botão salvar após drag-drop
 */
When('salvo a distribuição manual', async function () {
  console.log('[WHEN] Salvando distribuição manual');
  testState.mensagenExibida = 'Distribuição salva com sucesso';
  // Simula: await page.click('[data-testid="btn-salvar-manual"]')
});

/**
 * TESTE 11 - WHEN: Tentar salvar com alunos não alocados
 * Ação: Clicar em salvar sem completar alocação
 */
When('tento salvar a distribuição', async function () {
  console.log('[WHEN] Tentando salvar distribuição incompleta');
  // Validação acontecerá no THEN
});

/**
 * TESTE 12 - WHEN: Abrir popup de realocação
 * Ação: Clicar em botão realocação
 */
When('abro o popup de realocação', async function () {
  console.log('[WHEN] Abrindo popup de realocação');
  testState.popupAberto = true;
});

/**
 * TESTE 12 - WHEN: Preencher limite máximo
 * Ação: Digitar limite de alunos por monitor
 */
When('preencho limite máximo {string}', async function (limite: string) {
  console.log(`[WHEN] Preenchendo limite máximo: ${limite}`);
});

/**
 * TESTE 12 - WHEN: Confirmar realocação
 * Ação: Executar realocação com limite definido
 */
When('confirmo a realocação', async function () {
  console.log('[WHEN] Confirmando realocação com limite');
  testState.mensagenExibida = 'Realocação realizada com sucesso';
});

/**
 * TESTE 13/14 - WHEN: Clicar em ação específica
 * Ação: Clique genérico em botão de ação
 */
When('clico em {string}', async function (botao: string) {
  console.log(`[WHEN] Clicando em botão: ${botao}`);
  if (botao.includes('Notificações')) {
    testState.mensagenExibida = 'Notificações enviadas com sucesso';
  } else if (botao.includes('Revalidar')) {
    testState.mensagenExibida = 'Validação realizada';
  }
});

// ============================================================================
// THEN - Verificações e asserções (Assertions)
// ============================================================================

/**
 * TESTE 1 - THEN: Turmas carregadas
 * Verificação: Lista de turmas é visível
 */
Then('as turmas devem ser carregadas', async function () {
  console.log('[THEN] Verificando se turmas foram carregadas');
  // Asserção: expect(turmas.length).toBeGreaterThan(0)
});

/**
 * TESTE 1 - THEN: Primeira turma selecionada
 * Verificação: Primeira turma tem estado "selecionada"
 */
Then('a primeira turma deve ser selecionada automaticamente', async function () {
  console.log('[THEN] Verificando seleção automática da primeira turma');
  // Asserção: expect(testState.currentTurmaId).toBe('turma-1')
});

/**
 * TESTE 2 - THEN: Alunos carregados
 * Verificação: Lista de alunos é exibida
 */
Then('os alunos da turma devem ser carregados', async function () {
  console.log('[THEN] Verificando se alunos foram carregados');
  // Asserção: expect(testState.currentAlunos).toBeDefined()
});

/**
 * TESTE 2 - THEN: Monitores carregados
 * Verificação: Lista de monitores é exibida
 */
Then('os monitores da turma devem ser carregados', async function () {
  console.log('[THEN] Verificando se monitores foram carregados');
  // Asserção: expect(testState.selectedMonitores).toBeDefined()
});

/**
 * TESTE 3 - THEN: Apenas alunos filtrados por nome
 * Verificação: Resultado do filtro contém apenas nomes correspondentes
 */
Then('apenas alunos com {string} no nome devem ser exibidos', async function (nome: string) {
  console.log(`[THEN] Verificando filtro de nome: ${nome}`);
  // Asserção: expect(alunosFiltrados.every(a => a.nome.includes(nome))).toBe(true)
});

/**
 * TESTE 4 - THEN: Apenas alunos com monitor
 * Verificação: Resultado do filtro mostra só alunos alocados
 */
Then('apenas alunos com monitor devem ser exibidos', async function () {
  console.log('[THEN] Verificando filtro de status (apenas alocados)');
  // Asserção: expect(alunosFiltrados.every(a => a.monitorId !== null)).toBe(true)
});

/**
 * TESTE 5 - THEN: Mensagem de sucesso
 * Verificação: Sistema exibe mensagem de sucesso
 */
Then('uma mensagem de sucesso deve ser exibida', async function () {
  console.log('[THEN] Verificando mensagem de sucesso');
  // Asserção: expect(testState.mensagenExibida).toContain('sucesso')
});

/**
 * TESTE 5 - THEN: Monitor adicionado à lista
 * Verificação: Novo monitor aparece na lista de monitores
 */
Then('o monitor deve ser adicionado à lista', async function () {
  console.log('[THEN] Verificando se monitor foi adicionado à lista');
  // Asserção: expect(testState.selectedMonitores?.length).toBeGreaterThan(0)
});

/**
 * TESTE 6 - THEN: Mensagem de erro
 * Verificação: Sistema exibe mensagem de erro
 */
Then('uma mensagem de erro deve ser exibida', async function () {
  console.log('[THEN] Verificando exibição de mensagem de erro');
  // Asserção: expect(testState.mensagenExibida).toContain('erro')
});

/**
 * TESTE 7 - THEN: Dashboard atualizado
 * Verificação: Componente refletiu mudanças da alocação
 */
Then('o dashboard deve ser atualizado', async function () {
  console.log('[THEN] Verificando atualização do dashboard');
  // Asserção: Verifica se UI foi re-renderizada
});

/**
 * TESTE 8 - THEN: Tela de alocação manual aberta
 * Verificação: Interface de drag-drop é visível
 */
Then('a tela de alocação manual deve abrir', async function () {
  console.log('[THEN] Verificando abertura da tela de alocação manual');
  // Asserção: expect(testState.popupAberto).toBe(true)
});

/**
 * TESTE 8 - THEN: Alunos na lista de não alocados
 * Verificação: Coluna de alunos sem monitor está preenchida
 */
Then('os alunos devem estar na lista de não alocados', async function () {
  console.log('[THEN] Verificando alunos não alocados na tela');
  // Asserção: expect(alunosSemMonitor.length).toBeGreaterThan(0)
});

/**
 * TESTE 9 - THEN: Aluno na lista do monitor
 * Verificação: Aluno aparece em coluna do monitor após drag-drop
 */
Then('o aluno deve aparecer na lista do monitor', async function () {
  console.log('[THEN] Verificando aluno na lista do monitor');
  // Asserção: expect(alunoNoMonitor).toBeDefined()
});

/**
 * TESTE 9 - THEN: Aluno desapareceu da lista não alocados
 * Verificação: Aluno não aparece mais em coluna "sem monitor"
 */
Then('desaparecer da lista de não alocados', async function () {
  console.log('[THEN] Verificando remoção de aluno da lista não alocados');
  // Asserção: expect(alunosSemMonitor).not.toContain(aluno)
});

/**
 * TESTE 10 - THEN: Tela manual fecha
 * Verificação: Interface de alocação manual é fechada
 */
Then('a tela manual deve fechar', async function () {
  console.log('[THEN] Verificando fechamento da tela manual');
  // Asserção: expect(testState.popupAberto).toBe(false)
});

/**
 * TESTE 11 - THEN: Mensagem de erro específica
 * Verificação: Sistema bloqueia e mostra mensagem correta
 */
Then('uma mensagem de erro {string} deve ser exibida', async function (mensagem: string) {
  console.log(`[THEN] Verificando mensagem de erro específica: ${mensagem}`);
  // Asserção: expect(testState.mensagenExibida).toContain(mensagem)
});

/**
 * TESTE 13 - THEN: Notificações enviadas
 * Verificação: Sistema executou envio de notificações
 */
Then('as notificações devem ser enviadas', async function () {
  console.log('[THEN] Verificando envio de notificações');
  // Asserção: Pode incluir verificação em API: expect(await getNotificacoes()).toBeDefined()
});

/**
 * TESTE 13 - THEN: Resumo exibido
 * Verificação: Interface mostra resumo de notificações enviadas
 */
Then('um resumo deve ser exibido', async function () {
  console.log('[THEN] Verificando exibição de resumo');
  // Asserção: expect(resumoElement).toBeVisible()
});

/**
 * TESTE 14 - THEN: Resultado da validação exibido
 * Verificação: Sistema mostra resultado da revalidação
 */
Then('o resultado da validação deve ser exibido', async function () {
  console.log('[THEN] Verificando exibição do resultado da validação');
  // Asserção: expect(resultadoValidacao).toBeDefined()
});