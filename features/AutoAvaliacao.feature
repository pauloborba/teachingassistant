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

Scenario: Fazendo a autoavaliação sem sucesso
	Given que eu estou na página “Autoavaliação”
	And eu sou um aluno que ainda não fez a autoavaliação
	When eu não seleciono um conceito para cada uma das
metas
	And envio minha autoavaliação
	Then surge um popup informando que eu devo selecionar um
	conceito para cada uma das metas
	And eu confirmo que entendi que ocorreu um erro
	Then eu estarei da página “Autoavaliação” no mesmo estado
que deixei a mesma

Scenario: Fazendo relatório de auto-avaliação sem discrepância
Given que eu sou um professor logado no sistema com o login
“alexandre” e a senha “4321”
And eu selecionei a opção “Relatórios”
And eu selecionei a turma “ESS”
When  não houver discrepância entre mais de uma meta
avaliada pelos alunos comparadas com a do professor
Then nenhum aluno será mostrado na lista de avaliações
discrepantes
