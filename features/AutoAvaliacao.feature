Scenario: Adicionar auto-avaliação
	Given Estou na pagina de auto-avaliação
	And Eu vejo os campos para preencher os conceitos definidos
	When Eu preencho Alguns dos campos e confirmo
	Then Eu vejo uma mensagem de erro
	And Meus conceitos não foram salvos no sistema.

