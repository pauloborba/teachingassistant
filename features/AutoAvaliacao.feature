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
	Given estou logado como "Jose" na pagina de "Auto Avaliacao"
	And preencho com "MA" a meta "Entender conceitos de requisitos"
    And preencho com "MPA" a meta "Especificar requisitos com qualidade"
    And preencho com "MANA" a meta "Entender conceitos de gerência de configuração"
	When seleciono "confirmar"
    Then recebo uma mensagem de preenchimento bem sucedido 
    And volto para pagina de "Auto avaliacao"
    And vejo "MA" para a meta "Entender conceitos de requisitos"
    And vejo "MPA" para a meta "Especificar requisitos com qualidade"
    And vejo "MANA" para a meta "Entender conceitos de gerência de configuração"
    And nao posso auto avaliar novamente


Cenário de serviço
Scenario: Nova auto-avaliação com sucesso
	Given "Pedro" está armazenado no sistema
    And "Pedro" ainda não tem metas armazendas
	And "Pedro" preenche "MA" para a meta "Entender conceitos de requisitos"
    And "Pedro" preenche "MPA" para a meta "Especificar requisitos com qualidade"
    And "Pedro" preenche "MANA" para a meta "Entender conceitos de gerência de configuração"
	When "Pedro" tenta submeter a auto avaliacao
    Then O sistema armazena "MA" para a meta "Entender conceitos de requisitos" corretamente para o aluno "Pedro"
    And O sistema armazena "MPA" para a meta "Especificar requisitos com qualidade" corretamente para o aluno "Pedro"
    And O sistema armazena "MANA" para a meta "Entender conceitos de gerência de configuração" corretamente para o aluno "Pedro"


//cenario de preenchimento mal sucedido

Cenário de GUI
Scenario: Nova auto-avaliação mal sucedida 
    Given eu estou logado como "Maria" na página de "Auto Avaliacao"
    And "Maria" não possui metas armazenadas
    And "Maria"preenche com "MA" a meta "Entender conceitos de requisitos"
    And "Maria"preenche com "MPA" a meta "Especificar requisitos com qualidade"
    And "Maria" preenche com "Null" a meta "Entender conceitos de gerência de configuração"
    When "Maria" seleciona "confirmar"
    Then "Maria" recebe uma mensagem de preenchimento mal sucedido
    And "Maria" volta para página de "Auto Avaliacao"


Cenário de serviço
Scenario: Nova auto-avaliação mal sucedida
	Given "Pedro" está armazenado no sistema
    And "Pedro" ainda não tem metas armazendas
	And "Pedro" preenche "MA" para a meta "Entender conceitos de requisitos"
    And "Pedro" preenche "MPA" para a meta "Especificar requisitos com qualidade"
    And "Pedro" preenche "Null" para a meta "Entender conceitos de gerência de configuração"
	When "Pedro" tenta submeter a auto avaliacao
    Then O sistema não armazena conceito para a meta "Entender conceitos de requisitos"
    And O sistema não armazena conceito para a meta "Especificar requisitos com qualidade"
    And O sistema não armazena conceito para a meta "Entender conceitos de gerência de configuração"


//Discrepancia


// Quando nao ha Discrepancia

Scenario: Visualizando discrepância quando não há discrepância
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
    And o aluno "Paulo" auto avaliou "MANA" para "Especificar requisitos com qualidade"
    And o aluno "Paulo" auto avaliou "MPA" para "Entender conceitos de gerência de configuração"
    And o aluno "Sophia" auto avaliou "MA" para "Entender conceitos de requisitos"
    And o aluno "Sophia" auto avaliou "MA" para "Especificar requisitos com qualidade"
    And o aluno "Sophia" auto avaliou "MA" para "Entender conceitos de gerência de configuração"
	When seleciono "visualizar discrepancias"
	Then vejo uma lista vazia de alunos com discrepancia

// Quando ha discrepancia

Scenario: Visualizando discrepância quando há discrepância
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

// percentual de discrepancia

//descrever cenario em breve

