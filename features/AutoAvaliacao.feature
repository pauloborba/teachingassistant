Scenario: Adicionar auto-avaliação
	Given Estou na pagina de auto-avaliação
	And Eu vejo os campos para preencher os conceitos definidos
	When Eu preencho Alguns dos campos e confirmo
	Then Eu vejo uma mensagem de erro
	Then Passo adicional, não especificado
	And Meus conceitos não foram salvos no sistema.

Alteração master pra o primeiro commit

Scenario: verificar auto-avaliação
	Given Estou na pagina de auto-avaliação
	And Eu vejo os campos já preenchidos com os conceitos definidos
	When Eu vejo os dados e não há discrepância
	Then Eu seleciono o botão retornar
	And retorno a página inicial

Scenario: verificar auto-avaliação
	Given Estou na pagina de auto-avaliação
	And Eu vejo os campos já preenchidos com os conceitos definidos
	When Eu vejo os dados e há discrepância
	Then Eu seleciono o botão retornar
	And retorno a página inicial
<<<<<<< HEAD
=======

Primeira alteração na branch discrepantes
Segunda alteração na branch discrepantes
>>>>>>> discrepantes
