Scenario: Cadastro e atualização de alunos 
	Given Estou na pagina de cadastro de alunos
	And Eu vejo os campos para inserir os dados do aluno
	When Eu preencho todos os campos e confirmo
	Then Eu vejo uma feedback positivo
	And Os dados do aluno foram salvos no sistema.
