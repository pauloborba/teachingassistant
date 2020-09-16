

	Feature : Preenchimento de autoavaliação pelo aluno:


	Cenário de GUI:
    Scenario: Um aluno realiza a auto-avaliação com sucesso:
    Given: Estou logado como aluno com username <studentusername>
And: Estou na tela de preenchimento de avaliação
And:Eu estou no modo de realizar minha auto-avaliação
When: Eu preencho todas as metas com minha auto-avaliação
    And: Eu tento concluir minha auto-avaliação
    Then: Eu vejo uma mensagem da página sobre o sucesso da operação
    And: Eu vejo os resultados da a auto-avaliação e da avaliação dos professores nas determinadas metas na tela
        Cenário de serviço:
    Scenario: Um aluno realiza a auto-avaliação com sucesso:
    Given: Estou logado como aluno com username <studentusername>
And: Estou na tela de preenchimento de avaliação
And:Eu estou no modo de realizar minha auto-avaliação
When: Eu preencho todas as metas com minha auto-avaliação
    And: Eu tento concluir minha auto-avaliação
    Then: Os conceitos para cada meta são atribuídos no sistema

	Nova linha

