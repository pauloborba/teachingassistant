Scenario: Realizando Auto-avaliação com ausência de meta
	Given: estou em “auto-avaliação”
	And: eu vejo as metas para poder inserir a nota
	When: eu clico em uma meta consigo colocar (MA ou MPA ou MANA)
	And: coloco “MA” em todas notas, menos em uma meta
	Then: o botão de enviar notas não é liberado
	And: não consigo enviar as notas para o sistema
	And: o sistema avisa que está faltando uma nota


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
