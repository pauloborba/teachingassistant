	Feature: auto-avaliação
Como um professor ou aluno,
Eu quero adicionar a auto-avaliação dos alunos para todas as metas,
Para que que eu possa ver a avaliação do professor em comparação com a auto-avaliação dos alunos e analisá-las

Scenario: preenchimento bem sucedido da auto-avaliação
	Given que estou na página de “notas”,
	And eu vejo a aluna “Gabriela” sem as auto-avaliações preenchidas
	And o meu nome é “Gabriela”
	When eu adiciono a auto-avaliação “MA” na “META 1” e “MPA” na “META 2”
	Then eu estou na página de “notas”
	And posso ver que a estudante “Gabriela” está com a auto-avaliação “MA” na “META 1” e “MPA” na “META 2”

Scenario: preenchimento bem sucedido da auto-avaliação
	Given que existe uma aluna “Gabriela” no sistema,
	And “Gabriela” não possui as notas de auto-avaliação
	When eu adiciono a auto-avaliação “MA” na “META 1” e “MPA” na “META 2”
	Then está no sistema que “Gabriela” tem a auto-avaliação “MA” na “META 1” e “MPA” na “META 2”

