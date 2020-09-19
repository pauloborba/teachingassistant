Scenario: Adicionar auto-avaliação
	Given Estou na pagina de auto-avaliação
	And Eu vejo os campos para inserir as informações
	When Eu preencho todos os campos e confirmo
	Then Eu vejo uma feedback positivo
	And as auto-avaliações foram salvos no sistema.