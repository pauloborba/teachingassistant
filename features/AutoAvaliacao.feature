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

	GUI Scenario: Visualizacao de dados sobre auto-avaliacoes dos alunos de uma disciplina quando não ha auto-avaliacoes discrepantes
	    Given Eu estou na pagina “avaliacoes e auto-avaliacoes da disciplina ESS”
	    And A disciplina “ESS” tem “3” alunos: o aluno “1” tem conceito superior ao do professor em “1” de “5” metas, o aluno “2” so tem conceitos “inferiores” ao do professor, e o aluno “3” so tem conceitos “iguais” aos do professor
	    When Eu solicito os dados sobre as auto-avaliacoes da turma da disciplina “ESS”
	    Then Eu vejo que “0%” dos alunos fizeram auto-avaliacoes discrepantes
		And Vejo que um total de “0” alunos fizeram auto-avaliacoes discrepantes
		And Vejo que a lista de alunos que fizeram auto-avaliacoes discrepantes contem “0 alunos”