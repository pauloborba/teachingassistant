//Descricao da feature

Feature: Auto-avaliação
As a Aluno
I want to adicionar conceitos referentes a cada uma das metas avaliadas pelo professor.
So that eu posso comparar discrepâncias entre meus conceitos e do professor.

Feature: Auto-avaliação
As a Professor
I want to ver a quantidade, o percentual e a lista de alunos com auto-avaliações discrepantes.
So that eu posso gerenciar as discrepâncias entre conceitos atribuídos aos alunos e suas respectivas auto-avaliações.


//cenario de preenchimento bem sucedido

Cenário de GUI
Scenario: Adicionando os conceitos para auto-avaliação com sucesso
	Given Eu estou na página de preenchimento dos conceitos
	And preencho a meta “Entender conceitos de requisitos” com MA
    And preencho a meta “Especificar requisitos com qualidade” com MPA
    And preencho a meta “Entender conceitos de gerência de configuração” com MANA
	When confirmo o preenchimento de todos os conceitos
    Then recebo uma mensagem de preenchimento bem sucedido 
    And Vejo todos os conceitos preenchidos


Cenário de serviço
Scenario: Nova auto-avaliação
	Given estou logado como “Pedro”
	And todas as metas estão preenchidas
	When confirmo a auto-avaliação
    Then o sistema retorna uma mensagem de preenchimento bem sucedido
    And vejo a auto-avaliação armazenada no sistema adequadamente


Cenário de serviço
Scenario: Nova auto-avaliação
	Given estou logado como “Pedro”
	And todas as metas estão preenchidas
	When confirmo a auto-avaliação
    Then o sistema retorna uma mensagem de preenchimento bem sucedido
    And vejo a auto-avaliação armazenada no sistema adequadamente


//cenario de preenchimento mal sucedido

Cenario de GUI
Scenario: Nova auto-avaliação mal sucedida 
    Given eu estou na página de preenchimento de conceitos
    And preencho a meta “Entender conceitos de requisitos” com MA
    And preencho a meta “Especificar requisitos com qualidade” com MPA
    And não preencho a meta “Entender conceitos de gerência de configuração”
    When eu tento confirmar o preenchimento dos conceitos
    Then recebo uma mensagem de preenchimento mal sucedido
    And volto para página de preenchimento de conceitos
    And passo adicional


Cenário de serviço
Scenario: Nova auto-avaliação mal sucedida
    Given estou logado como “Pedro”
    And a meta “Entender conceitos de requisitos” está preenchida
    And a meta “Especificar requisitos com qualidade” está preenchida
    And a meta “Entender conceitos de gerência de configuração” não está preenchida
    When confirmo a auto-avaliação
    Then o sistema retorna uma mensagem de preenchimento mal sucedido
    And auto-avaliação não é armazenada no sistema
    And passo adicional

// Quando nao ha Discrepancia

Scenario: Visualizando discrepâncias
	Given eu estou na página de visualização de auto-avaliações
    And “Pedro” tem “0%” de discrepância
	And “Paulo” tem “0%” de discrepância
	And “Sophia” tem “20%” de discrepância
	When seleciono a lista de alunos com discrepância
	Then vejo uma lista vazia de alunos

// Quando ha discrepancia

Scenario: Visualizando discrepâncias
	Given estou logado como "Thiago"
    And estou na página "Alunos"
    And "Thiago" avaliou "Pedro" com "MPA" em  "Entender conceitos de requisitos"
    And "Thiago" avaliou "Pedro" com "MA" em  "Especificar requisitos com qualidade"
    And "Thiago" avaliou "Pedro" com "MPA" em  "Entender conceitos de gerência de configuração"
    And "Thiago" avaliou "Paulo" com "MA" em  "Entender conceitos de requisitos"
    And "Thiago" avaliou "Paulo" com "MANA" em  "Especificar requisitos com qualidade"
    And "Thiago" avaliou "Paulo" com "MPA" em  "Entender conceitos de gerência de configuração"
    And "Thiago" avaliou "Sophia" com "MA" em  "Entender conceitos de requisitos"
    And "Thiago" avaliou "Sophia" com "MA" em  "Especificar requisitos com qualidade"
    And "Thiago" avaliou "Sophia" com "MA" em  "Entender conceitos de gerência de configuração"	
    And o aluno "Pedro" auto avaliou "MPA" para "Entender conceitos de requisitos"
    And o aluno "Pedro" auto avaliou "MA" para "Especificar requisitos com qualidade"
    And o aluno "Pedro" auto avaliou "MPA" para "Entender conceitos de gerência de configuração"
    And o aluno "Paulo" auto avaliou "MA" para "Entender conceitos de requisitos"
    And o aluno "Paulo" auto avaliou "MPA" para "Especificar requisitos com qualidade"
    And o aluno "Paulo" auto avaliou "MPA" para "Entender conceitos de gerência de configuração"
    And o aluno "Sophia" auto avaliou "MA" para "Entender conceitos de requisitos"
    And o aluno "Sophia" auto avaliou "MA" para "Especificar requisitos com qualidade"
    And o aluno "Sophia" auto avaliou "MA" para "Entender conceitos de gerência de configuração"
	When "Thiago" seleciona "visualizar discrepancias"
	Then "Thiago" vê uma lista com o Aluno "Paulo"
    And sua porcentagem de "33.3%" de discrepancia
    And quantidade de discrepancias igual a "1"
