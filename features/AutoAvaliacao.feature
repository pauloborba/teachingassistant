Auto-Avaliação
Scenario: auto-avaliação bem sucedida
	Given Estou na página “auto-avaliação” logado como “João”
	And Eu vejo que as notas da auto-avaliação não estão
	preenchidas
	When Eu preencho todas as notas de auto-avaliação em
	sequência com os valores “MPA, MA, MA”
	Then Vejo uma tela de sucesso no procedimento
	and Vejo cada meta preenchida com sua devida auto-avaliação
Scenario: auto-avaliação bem sucedida
	Given O aluno “João” está cadastrado no sistema com as notas
	com as notas “MA, MA, MPA” na avaliação do professor
	And Não há nenhum valor cadastrado na auto-avaliação.
	When Todas as notas de auto-avaliação são preenchidas
	com os valores “MPA, MA, MA”
	Then O sistema retorna uma mensagem de sucesso
	And As notas estão devidamente cadastradas na coluna de
	auto-avaliação com os valores “MPA, MA, MA”

Scenario: auto-avaliação mal sucedida
	Given Estou na página “auto-avaliação” logado como “João”
	And Eu vejo que as notas da auto-avaliação não estão
	preenchidas
	When Eu preencho algumas notas de auto-avaliação com os
	valores “MPA, MA, -”
	Then Vejo uma tela de erro dizendo que nem todas as notas
	foram preenchidas.
	And A página solicita que todas as notas sejam devidamente
	preenchidas 
	And Aconteceu nada
Scenario: auto-avaliação mal sucedida
	Given O aluno “João” está cadastrado no sistema com as notas
	com as notas “MA, MA, MPA” na avaliação do professor
	And Não há nenhum valor cadastrado na auto-avaliação.
	When Algumas notas de auto-avaliação são preenchidas
	com os valores “MPA, MA, -”
	Then O sistema retorna uma mensagem de erro devido ao não 
	preenchimento de todas as notas
	And O sistema aguarda novamente o preenchimento de todas as 
	notas
	And Aconteceu nada
Scenario: Nenhum aluno discrepante
	Given Estou na página “Visão Geral” logado como “Professor João”
	And Eu vejo na lista de alunos “André Ferreira” com as notas “MA, MA, MA, MA, MA”, “Antonio Netto” com as notas “MPA, MANA, MPA, MANA, MANA” e “Francisco Marcos” com as notas “MA, MPA, MA, MA, MPA”.
	When Eu peço ao sistema para analisar a discrepância entre estes alunos.
	Then Vejo uma nova tela mostrando que não há nenhum aluno com nota discrepante.
Scenario: Apenas um aluno com nota discrepante.
	Given Estou na página “Visão Geral” logado como “Professor João”
	And Eu vejo, na lista de alunos, “André Ferreira” com as notas “MA, MA, MA, MA, MA”,  “Antonio Netto” com as notas “MPA, MANA, MPA, MANA, MANA” e “Francisco Marcos” com as notas “MA, MPA, MA, MA, MPA”.
	When Eu peço ao sistema para analisar a discrepância
	Then Vejo uma nova tela mostrando que há um aluno com nota discrepante, representando 33% da turma, seu nome é “André Ferreira” e possui uma discrepância de 40%.