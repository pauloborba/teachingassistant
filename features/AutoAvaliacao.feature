Feature: Auto-Avaliação
	As a Aluno da disciplina
	I want definir os conceitos MANA, MPA ou MA, a cada uma
das minhas metas
So that o Professor tenha um feedback de como eu me sinto
em relação às metas que me foram atribuídas.

Scenario: Fazendo a autoavaliação com sucesso
	Given eu estou na página “Autoavaliação”
	And eu sou um aluno que ainda não fez a autoavaliação
	When eu seleciono um conceito para cada uma das metas
	And envio minha autoavaliação
	Then surge um popup para eu revisar minhas escolhas
	And eu confirmo minhas escolhas
	Then surge um popup informando que a autoavaliação foi feita 
	com sucesso
	And eu confirmo que ocorreu tudo bem
	Then eu estarei na página “Detalhamento do Aluno”

Mudança teste