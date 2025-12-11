# language: pt
Funcionalidade: Dashboard do Professor
  Como um professor
  Quero gerenciar turmas, monitores e alocações
  Para coordenar o ensino de forma eficiente

  Cenário: Carregar turmas ao inicializar
    Quando o componente é inicializado com um professor válido
    Então as turmas devem ser carregadas
    E a primeira turma deve ser selecionada automaticamente

  Cenário: Selecionar uma turma
    Dado que o dashboard está inicializado
    Quando seleciono a turma "turma-2"
    Então os alunos da turma devem ser carregados
    E os monitores da turma devem ser carregados

  Cenário: Filtrar alunos por nome
    Dado que alunos estão carregados
    Quando aplico o filtro de nome "João"
    Então apenas alunos com "João" no nome devem ser exibidos

  Cenário: Filtrar alunos por status de alocação
    Dado que alunos estão carregados
    Quando aplico o filtro de status "alocado"
    Então apenas alunos com monitor devem ser exibidos

  Cenário: Cadastrar novo monitor
    Dado que uma turma está selecionada
    Quando abro o popup de cadastro
    E preencho nome "Monitor A" e matricula "M100"
    E confirmo o cadastro
    Então uma mensagem de sucesso deve ser exibida
    E o monitor deve ser adicionado à lista

  Cenário: Validar campos obrigatórios do monitor
    Dado que o popup de cadastro está aberto
    Quando deixo o campo nome vazio
    E confirmo o cadastro
    Então uma mensagem de erro deve ser exibida

  Cenário: Executar alocação aleatória
    Dado que monitores estão cadastrados
    Quando abro o popup de alocação
    E seleciono "alocação aleatória"
    E confirmo a alocação
    Então uma mensagem de sucesso deve ser exibida
    E o dashboard deve ser atualizado

  Cenário: Executar alocação manual
    Dado que monitores estão cadastrados
    E alunos estão carregados
    Quando abro o popup de alocação
    E seleciono "alocação manual"
    Então a tela de alocação manual deve abrir
    E os alunos devem estar na lista de não alocados

  Cenário: Mover aluno para monitor por drag-drop
    Dado que a tela de alocação manual está aberta
    Quando arrasto o aluno "aluno-1" para o monitor "monitor-1"
    Então o aluno deve aparecer na lista do monitor
    E desaparecer da lista de não alocados

  Cenário: Validar alocação manual completa
    Dado que alunos foram movidos para monitores
    Quando salvo a distribuição manual
    Então uma mensagem de sucesso deve ser exibida
    E a tela manual deve fechar

  Cenário: Bloquear alocação manual com alunos sem monitor
    Dado que existem alunos não alocados
    Quando tento salvar a distribuição
    Então uma mensagem de erro "Há alunos sem monitor" deve ser exibida

  Cenário: Executar realocação
    Dado que uma turma está selecionada
    Quando abro o popup de realocação
    E preencho limite máximo "5"
    E confirmo a realocação
    Então uma mensagem de sucesso deve ser exibida

  Cenário: Enviar notificações
    Dado que uma turma está selecionada
    Quando clico em "Enviar Notificações"
    Então as notificações devem ser enviadas
    E um resumo deve ser exibido

  Cenário: Revalidar alocações
    Dado que alocações foram realizadas
    Quando clico em "Revalidar"
    Então o resultado da validação deve ser exibido