Scenario: Adicionar auto-avaliação
	Given Estou na pagina de auto-avaliação
	And Eu vejo os campos para preencher os conceitos definidos
	When Eu preencho TODOS os campos e confirmo
	Then Eu vejo uma mensagem de confirmação
	And Meus conceitos foram salvos no sistema.

