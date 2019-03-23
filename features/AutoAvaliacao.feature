Scenario: Realizando Auto-avaliação com ausência de meta
	Given: estou em “auto-avaliação”
	And: eu vejo as metas para poder inserir a nota
	When: eu clico em uma meta consigo colocar (MA ou MPA ou MANA)
	And: coloco “MA” em todas notas, menos em uma meta
	Then: o botão de enviar notas não é liberado
	And: não consigo enviar as notas para o sistema
	And: o sistem avisa que falta nota a ser preenchida


Scenario: Nenhuma discrepância nas auto-avaliações dos alunos
	Given: professor “borba” está devidamente logado
	And: está na página “Disciplinas”
	When: quando clica em uma de suas disciplinas ministradas “ESS”
	Then: aparece um pop-up com um feedback positivo 
	And: não houve nenhum aluno com auto-avaliação discrepante

Scenario: Discrepância nas auto-avaliações de alunos
			Given: professor “borba” está devidamente logado
			And: está na página “Disciplinas”
			When: quando clica em uma de suas disciplinas ministradas “ESS”
			Then: aparece um balão em destaque com o percentual “33%”, a quantidade “1”, e a lista de alunos “Henrique Andrade Mariz” que estão com auto-avaliações discrepantes

Service Scenario: Armazenamento de auto-avaliação com ausência de Meta
	Given: aluno “Henrique” devidamente logado
	And: A lista de auto-avaliação está preenchida com Notas “MA”
	And: um campo de nota está vazio “”
	When: Eu tento enviar a lista de auto-avaliação para o sistema
	Then: O sistema não recebe nenhuma lista de auto-avaliação
	And: O sistema espera o Aluno terminar de preencher a lista de auto-avaliação

Scenario: Armazenamento de auto-avaliação com Metas atribuídas
	Given: aluno “Henrique” devidamente logado
	And: A lista de auto-avaliação está preenchida com notas “MA”
	When: O sistema recebe uma lista de auto-avaliação
	Then: A lista é devidamente armazenada no sistema
	And: feedback positivo é demonstrado na tela
