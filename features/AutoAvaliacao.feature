//Descrevendo a feature

Feature: Auto-avaliação
As a Aluno
I want to adicionar conceitos referentes a cada uma das metas avaliadas pelo professor.
So that eu posso comparar discrepâncias entre meus conceitos e do professor.

Feature: Auto-avaliação
As a Professor
I want to ver a quantidade, o percentual e a lista de alunos com auto-avaliações discrepantes.
So that eu posso gerenciar as discrepâncias entre conceitos atribuídos aos alunos e suas respectivas auto-avaliações.


// cenário de preenchimento bem sucedido 
Cenario de GUI

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




// preenchimento mal sucedido

Cenario de GUI
Scenario: Nova auto-avaliação mal sucedida 
    Given eu estou na página de preenchimento de conceitos
    And preencho a meta “Entender conceitos de requisitos” com MA
    And preencho a meta “Especificar requisitos com qualidade” com MPA
    And não preencho a meta “Entender conceitos de gerência de configuração”
    When eu tento confirmar o preenchimento dos conceitos
    Then recebo uma mensagem de preenchimento mal sucedido
    And volto para página de preenchimento de conceitos


Cenário de serviço
Scenario: Nova auto-avaliação mal sucedida
    Given estou logado como “Pedro”
    And a meta “Entender conceitos de requisitos” está preenchida
    And a meta “Especificar requisitos com qualidade” está preenchida
    And a meta “Entender conceitos de gerência de configuração” não está preenchida

    When confirmo a auto-avaliação
    Then o sistema retorna uma mensagem de preenchimento mal sucedido
    And auto-avaliação não é armazenada no sistema

// Quando nao ha Discrepancia

Scenario: Visualizando discrepâncias
	Given eu estou na página de visualização de auto-avaliações
    And “Pedro” tem “0%” de discrepância
	And “Paulo” tem “0%” de discrepância
	And “Sophia” tem “20%” de discrepância
	When seleciono a lista de alunos com discrepância
	Then vejo uma lista vazia de alunos
