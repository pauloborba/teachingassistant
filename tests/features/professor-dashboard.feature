# language: pt

# ============================================================================
# CATEGORIA: TESTES DE ACEITAÇÃO GUI
# Framework: Cucumber
# Padrão: BDD (Behavior Driven Development)
# Estrutura: Given/When/Then (Dado/Quando/Então)
# Descrição: Testes de aceitação que validam o comportamento da interface
#            gráfica do Dashboard do Professor. Cada cenário representa uma
#            funcionalidade do usuário final (professor).
# ============================================================================

Funcionalidade: Dashboard do Professor - Testes de Aceitação GUI
  Como um professor
  Quero gerenciar turmas, monitores e alocações
  Para coordenar o ensino de forma eficiente

  # =========================================================================
  # TESTE 1: Carregamento Inicial do Dashboard
  # Dado: Componente recém-inicializado
  # Quando: Aplicação é carregada com professor válido
  # Então: Turmas são listadas e primeira é selecionada
  # =========================================================================
  Cenário: Carregar turmas ao inicializar
    Quando o componente é inicializado com um professor válido
    Então as turmas devem ser carregadas
    E a primeira turma deve ser selecionada automaticamente

  # =========================================================================
  # TESTE 2: Seleção de Turma
  # Dado: Dashboard com múltiplas turmas
  # Quando: Usuário clica em turma específica
  # Então: Alunos e monitores daquela turma são carregados
  # =========================================================================
  Cenário: Selecionar uma turma
    Dado que o dashboard está inicializado
    Quando seleciono a turma "turma-2"
    Então os alunos da turma devem ser carregados
    E os monitores da turma devem ser carregados

  # =========================================================================
  # TESTE 3: Filtro por Nome de Aluno
  # Dado: Lista de alunos carregada
  # Quando: Aplicar filtro com termo "João"
  # Então: Apenas alunos com "João" no nome são exibidos
  # =========================================================================
  Cenário: Filtrar alunos por nome
    Dado que alunos estão carregados
    Quando aplico o filtro de nome "João"
    Então apenas alunos com "João" no nome devem ser exibidos

  # =========================================================================
  # TESTE 4: Filtro por Status de Alocação
  # Dado: Lista de alunos com e sem monitor
  # Quando: Selecionar filtro "alocado"
  # Então: Apenas alunos com monitor atribuído são mostrados
  # =========================================================================
  Cenário: Filtrar alunos por status de alocação
    Dado que alunos estão carregados
    Quando aplico o filtro de status "alocado"
    Então apenas alunos com monitor devem ser exibidos

  # =========================================================================
  # TESTE 5: Cadastro de Monitor - Sucesso
  # Dado: Turma selecionada
  # Quando: Abrir popup de cadastro, preencher dados e confirmar
  # Então: Monitor é adicionado à lista com mensagem de sucesso
  # =========================================================================
  Cenário: Cadastrar novo monitor
    Dado que uma turma está selecionada
    Quando abro o popup de cadastro
    E preencho nome "Monitor A" e matricula "M100"
    E confirmo o cadastro
    Então uma mensagem de sucesso deve ser exibida
    E o monitor deve ser adicionado à lista

  # =========================================================================
  # TESTE 6: Validação de Campos Obrigatórios
  # Dado: Popup de cadastro aberto
  # Quando: Tentar cadastrar deixando nome vazio
  # Então: Mensagem de erro impede cadastro
  # =========================================================================
  Cenário: Validar campos obrigatórios do monitor
    Dado que o popup de cadastro está aberto
    Quando deixo o campo nome vazio
    E confirmo o cadastro
    Então uma mensagem de erro deve ser exibida

  # =========================================================================
  # TESTE 7: Alocação Aleatória
  # Dado: Monitores cadastrados
  # Quando: Selecionar alocação aleatória e confirmar
  # Então: Sistema aloca alunos aleatoriamente entre monitores
  # =========================================================================
  Cenário: Executar alocação aleatória
    Dado que monitores estão cadastrados
    Quando abro o popup de alocação
    E seleciono "alocação aleatória"
    E confirmo a alocação
    Então uma mensagem de sucesso deve ser exibida
    E o dashboard deve ser atualizado

  # =========================================================================
  # TESTE 8: Alocação Manual - Abertura
  # Dado: Monitores e alunos carregados
  # Quando: Selecionar modo alocação manual
  # Então: Tela de drag-drop é exibida com alunos não alocados
  # =========================================================================
  Cenário: Executar alocação manual
    Dado que monitores estão cadastrados
    E alunos estão carregados
    Quando abro o popup de alocação
    E seleciono "alocação manual"
    Então a tela de alocação manual deve abrir
    E os alunos devem estar na lista de não alocados

  # =========================================================================
  # TESTE 9: Alocação Manual - Drag-Drop
  # Dado: Tela de alocação manual aberta
  # Quando: Arrastar aluno para coluna de monitor
  # Então: Aluno move-se para lista do monitor
  # =========================================================================
  Cenário: Mover aluno para monitor por drag-drop
    Dado que a tela de alocação manual está aberta
    Quando arrasto o aluno "aluno-1" para o monitor "monitor-1"
    Então o aluno deve aparecer na lista do monitor
    E desaparecer da lista de não alocados

  # =========================================================================
  # TESTE 10: Alocação Manual - Validação Completa
  # Dado: Alunos já foram movidos para monitores
  # Quando: Clicar em salvar distribuição
  # Então: Tela fecha e dashboard é atualizado
  # =========================================================================
  Cenário: Validar alocação manual completa
    Dado que alunos foram movidos para monitores
    Quando salvo a distribuição manual
    Então uma mensagem de sucesso deve ser exibida
    E a tela manual deve fechar

  # =========================================================================
  # TESTE 11: Bloqueio de Alocação Incompleta
  # Dado: Existem alunos sem monitor atribuído
  # Quando: Tentar salvar distribuição
  # Então: Sistema bloqueia e mostra erro
  # =========================================================================
  Cenário: Bloquear alocação manual com alunos sem monitor
    Dado que existem alunos não alocados
    Quando tento salvar a distribuição
    Então uma mensagem de erro "Há alunos sem monitor" deve ser exibida

  # =========================================================================
  # TESTE 12: Realocação de Alunos
  # Dado: Turma com alocações existentes
  # Quando: Abrir popup de realocação com limite de carga
  # Então: Sistema redistribui alunos respeitando limite máximo
  # =========================================================================
  Cenário: Executar realocação
    Dado que uma turma está selecionada
    Quando abro o popup de realocação
    E preencho limite máximo "5"
    E confirmo a realocação
    Então uma mensagem de sucesso deve ser exibida

  # =========================================================================
  # TESTE 13: Envio de Notificações
  # Dado: Turma selecionada com alocações
  # Quando: Clicar em enviar notificações
  # Então: Notificações são enviadas e resumo é exibido
  # =========================================================================
  Cenário: Enviar notificações
    Dado que uma turma está selecionada
    Quando clico em "Enviar Notificações"
    Então as notificações devem ser enviadas
    E um resumo deve ser exibido

  # =========================================================================
  # TESTE 14: Revalidação de Alocações
  # Dado: Alocações foram realizadas
  # Quando: Clicar em revalidar
  # Então: Sistema verifica validade das alocações e exibe resultado
  # =========================================================================
  Cenário: Revalidar alocações
    Dado que alocações foram realizadas
    Quando clico em "Revalidar"
    Então o resultado da validação deve ser exibido

