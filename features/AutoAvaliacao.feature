Feature: Auto-avaliacao
    As a Aluna(o)
	I want to adicionar uma unica vez conceitos de avaliação para todas as metas de uma disciplina visualizando os conceitos atribuidos a cada uma delas pelo docente responsavel
	So that eu posso registrar minha auto-avaliacao no sistema

	Scenario: Adicionando conceitos de auto-avaliação MPA, MA e MA às metas de uma disciplina
	    Given Eu estou na pagina “auto-avaliacao da disciplina ESS”
	    And A disciplina “ESS” tem “3” metas: “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerencia de configuracao”
	    When Eu adiciono os conceitos “MPA”, “MA” e “MA” para as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerência de configuração” (respectivamente) e tento registrar as adicoes
	    Then Os conceitos sao registrados pelo sistema
	    And Eu não estou mais na pagina “auto-avaliacao da disciplina ESS”

	Scenario: Adicionando conceitos de auto-avaliacao MPA, - e MA as metas de uma disciplina
	    Given Eu estou na pagina “auto-avaliacao da disciplina ESS”
	    And A disciplina “ESS” tem 3 metas: “Entender conceitos de requisitos”, “Especificar requisitos com qualidade” e “Entender conceitos de gerencia de configuracao”
	    When Eu adiciono os conceitos “MPA” e “MA” para as metas “Entender conceitos de requisitos” e “Entender conceitos de gerencia de configuracao” (respectivamente) e tento registrar as adicoes
	    Then Os conceitos não sao registrados pelo sistema
	    And Eu ainda estou na pagina “auto-avaliacao da disciplina ESS”
	    And Eu vejo uma mensagem de erro