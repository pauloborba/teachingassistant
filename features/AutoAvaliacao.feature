

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
	

	Cenário de GUI
    Scenario Outline: Um aluno tenta fazer uma auto-avaliação parcial
    Given: Estou logado como aluno com username <studentusername>
And: Estou na tela de preenchimento de avaliação
When: Eu preencho parte das colunas relacionadas a auto-avaliação de metas em branco
Then: Eu vejo uma mensagem de erro de não ter terminado a auto-avaliação
And: Eu vejo que ainda é possível fazer a auto-avaliação
And: Eu vejo que minhas respostas nas metas não foram salvas
And: Eu ainda vejo as avaliações que os professores deram para mim nas determinadas metas

	Linha extra no meio do arquivo

    Cenário de serviço:
	Scenario Outline: Um aluno tenta fazer uma auto-avaliação parcial
	Given: Estou logado como aluno com username <studentusername>
	And: Estou na tela de preenchimento de avaliação
	And:Eu estou no modo de realizar minha auto-avaliação
	When: Eu deixo algumas colunas relacionadas a metas em branco
	And: Eu tento concluir minha auto-avaliação
	Then: O sistema não é atualizado e o valor das auto-avaliações continuam em branco.
	And: O sistema ainda deve poder receber novas informações 
	And: O sistema deve permanecer logado com o aluno
	
   Cenário de GUI
	Scenario Outline: Um aluno realiza a auto-avaliação completa sem notas discrepantes:
	Given: Estou logado como aluno com username <studentusername>
	And: Estou na tela de preenchimento de avaliação
	And:Eu estou no modo de realizar minha auto-avaliação
	And:Eu vejo as avaliações que os professores deram para mim nas determinadas metas
    	When: Eu preencho todas as metas com minha auto-avaliação
    	And: Eu insiro conceitos sem discrepâncias quando comparados aos do professor
        And: Eu tento concluir minha auto-avaliação
        Then: Eu vejo uma mensagem da página sobre o sucesso da operação
        And: Eu vejo os resultados da a auto-avaliação e da avaliação dos professores nas determinadas metas na tela

    Cenário de Serviço
	Scenario Outline: Um aluno realiza a auto-avaliação completa com notas discrepantes:
        Given: Estou logado como professor com username <teacherusername>
        When: Eu entro na tela de alunos com auto avaliações discrepantes 
        Then: Eu vejo a quantidade de alunos com auto-avaliações discrepantes
        And: Eu vejo a porcentagem de alunos com auto-avaliações discrepantes
        And: Eu tenho a opção de ver a lista de alunos que estão com auto-avaliações discrepantes



