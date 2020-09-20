Scenario: Adicionar auto-avaliação
	Given Estou na pagina de auto-avaliação
	And Eu vejo os campos para inserir as informações
	When Eu preencho todos os campos e confirmo
	Then Eu vejo uma feedback positivo
	And as auto-avaliações foram salvos no sistema.
    And eu posso retornar a home do sistema.

Scenario: Adicionar auto-avaliação
	Given Estou na pagina de auto-avaliação
	And Eu vejo os campos para inserir as informações
	When Eu preencho ALGUNS dos campos e confirmo
	Then Eu vejo um alerta do sistema com o campo errado
	And as auto-avaliações não foram salvos no sistema.

Scenario: Adicionar auto-avaliação
	Given Estou na pagina de auto-avaliação
	And Eu vejo os campos para inserir as informações
	When Eu preencho ALGUNS dos campos com tipos errados e confirmo
	Then Eu vejo uma feedback de erro
	And as auto-avaliações não foram salvos no sistema.
