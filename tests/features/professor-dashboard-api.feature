# language: pt

# ============================================================================
# CATEGORIA: TESTES DE SERVIÇO (API)
# Framework: Cucumber
# Padrão: BDD (Behavior Driven Development)
# Estrutura: Given/When/Then (Dado/Quando/Então)
# Descrição: Testes de integração que validam os endpoints HTTP da API.
#            Cada cenário testa a comunicação entre cliente e servidor,
#            verificando status HTTP, validação de dados e fluxos de negócio
#            via requisições REST (GET, POST).
# ============================================================================

Funcionalidade: Dashboard do Professor - Testes de Serviço (API)
  Como um desenvolvedor
  Quero testar as APIs de gerenciamento de turmas, monitores e alocações
  Para garantir que os endpoints funcionam corretamente

  # =========================================================================
  # TESTE API 1: Listar Turmas
  # Dado: Sistema com turmas cadastradas
  # Quando: Fazer requisição GET /api/turmas
  # Então: Retorna status 200 com lista de turmas
  # =========================================================================
  Cenário: Listar turmas via API
    Quando faço uma requisição GET para "/api/turmas" (API)
    Então o status HTTP deve ser 200
    E a resposta deve conter uma lista de turmas

  # =========================================================================
  # TESTE API 2: Buscar Turma Específica
  # Dado: Turma com ID conhecida
  # Quando: Fazer requisição GET /api/turmas/:id
  # Então: Retorna dados da turma específica
  # =========================================================================
  Cenário: Buscar turma específica via API
    Dado que existe uma turma com ID "turma-1" (API)
    Quando faço uma requisição GET para "/api/turmas/turma-1" (API)
    Então o status HTTP deve ser 200
    E a resposta deve conter os dados da turma

  # =========================================================================
  # TESTE API 3: Listar Alunos de uma Turma
  # Dado: Turma selecionada
  # Quando: Fazer requisição GET /api/turmas/:id/alunos
  # Então: Retorna lista de alunos daquela turma
  # =========================================================================
  Cenário: Listar alunos de uma turma via API
    Dado que existe uma turma com ID "turma-1" (API)
    Quando faço uma requisição GET para "/api/turmas/turma-1/alunos" (API)
    Então o status HTTP deve ser 200
    E a resposta deve conter lista de alunos

  # =========================================================================
  # TESTE API 4: Cadastrar Monitor
  # Dado: Dados válidos de monitor
  # Quando: Fazer requisição POST /api/monitores
  # Então: Monitor é criado e retorna ID
  # =========================================================================
  Cenário: Cadastrar novo monitor via API
    Quando faço uma requisição POST para "/api/monitores" com dados: (API)
      | nome      | Monitor A |
      | matricula | M100      |
    Então o status HTTP deve ser 201
    E a resposta deve conter um ID do monitor

  # =========================================================================
  # TESTE API 5: Validar Campos Obrigatórios
  # Dado: Dados incompletos de monitor
  # Quando: Fazer requisição POST /api/monitores sem nome
  # Então: Retorna erro 400 com mensagem de validação
  # =========================================================================
  Cenário: Validar campos obrigatórios na criação de monitor
    Quando faço uma requisição POST para "/api/monitores" com dados: (API)
      | matricula | M100 |
    Então o status HTTP deve ser 400
    E a resposta deve conter erro de validação

  # =========================================================================
  # TESTE API 6: Alocação Aleatória
  # Dado: Monitores e alunos cadastrados
  # Quando: Fazer requisição POST /api/alocacao/aleatoria
  # Então: Alunos são distribuídos entre monitores
  # =========================================================================
  Cenário: Executar alocação aleatória via API
    Dado que existem monitores e alunos cadastrados (API)
    Quando faço uma requisição POST para "/api/alocacao/aleatoria" com dados: (API)
      | turmaId | turma-1 |
    Então o status HTTP deve ser 200
    E a resposta deve conter resultado da alocação

  # =========================================================================
  # TESTE API 7: Validar Alocação Manual
  # Dado: Distribuição manual realizada
  # Quando: Fazer requisição POST /api/alocacao/validar
  # Então: Sistema verifica se todos alunos têm monitor
  # =========================================================================
  Cenário: Validar alocação manual via API
    Dado que existe uma alocação manual completa (API)
    Quando faço uma requisição POST para "/api/alocacao/validar" (API)
    Então o status HTTP deve ser 200
    E a resposta deve indicar alocação válida

  # =========================================================================
  # TESTE API 8: Bloquear Alocação Incompleta
  # Dado: Alunos não alocados
  # Quando: Fazer requisição POST /api/alocacao/validar
  # Então: Retorna erro indicando alunos não alocados
  # =========================================================================
  Cenário: Rejeitar alocação incompleta via API
    Dado que existem alunos não alocados (API)
    Quando faço uma requisição POST para "/api/alocacao/validar" (API)
    Então o status HTTP deve ser 422
    E a resposta deve conter lista de alunos não alocados

  # =========================================================================
  # TESTE API 9: Realocação com Limite
  # Dado: Alocações existentes
  # Quando: Fazer requisição POST /api/alocacao/realocacao com limite
  # Então: Monitores são redistribuídos respeitando limite
  # =========================================================================
  Cenário: Executar realocação com limite máximo via API
    Dado que existe uma alocação anterior (API)
    Quando faço uma requisição POST para "/api/alocacao/realocacao" com dados: (API)
      | turmaId | turma-1 |
      | maxAlunos | 5 |
    Então o status HTTP deve ser 200
    E a resposta deve conter nova distribuição

  # =========================================================================
  # TESTE API 10: Enviar Notificações
  # Dado: Alocações realizadas
  # Quando: Fazer requisição POST /api/notificacoes/enviar
  # Então: Notificações são enviadas e retorna resumo
  # =========================================================================
  Cenário: Enviar notificações via API
    Dado que existem alocações realizadas (API)
    Quando faço uma requisição POST para "/api/notificacoes/enviar" com dados: (API)
      | turmaId | turma-1 |
    Então o status HTTP deve ser 200
    E a resposta deve conter resumo de notificações
