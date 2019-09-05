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
	Then está no sistema oiiiiiii que “Gabriela” tem a auto-avaliação “MA” na “META 1” e “MPA” na “META 2”

Scenario: preenchimento mal sucedido da auto-avaliação
	Given que estou na página de “notas”,
	And eu vejo a estudante “Gabriela” sem as auto-avaliações preenchidas
	And o meu nome é “Gabriela”
	When eu adiciono a auto-avaliação “MA” na “META 1”, mas não adiciono a auto-avaliação da “META 2” 
	Then eu estou na página de “notas”
	And eu posso ver uma mensagem de erro com relação ao não preenchimento de todas as auto-avaliações
	And eu vejo a estudante “Gabriela” sem as auto-avaliações preenchidas

Scenario: preenchimento mal sucedido da auto-avaliação
	Given que existe uma aluna “Gabriela” no sistema,
	And “Gabriela” não possui as notas de auto-avaliação
	When eu adiciono a auto-avaliação “MA” na “META 1”
	Then o sistema lança uma mensagem de erro com relação ao preenchimento das auto-avaliações
	And “Gabriela” não possui as notas de auto-avaliação
	And [MUDANCAS FEITAS AQUI]
	
Scenario: preenchimento das notas sem discrepância
	Given que eu estou na página de “notas”
	And a aluna “Luana” tem a auto-avaliação “MA” na “META 1”, “MA” na “META 2”, “MA” na “META 3”, “MA” na “META 4” e “MA” na “META 5”
And o aluno “Hugo” tem a auto-avaliação “MPA” na “META 1”, “MANA” na “META 2”, “MPA” na “META 3”, “MPA” na “META 4” e “MPA” na “META 5”
And o aluno “Victor” tem a auto-avaliação “MPA” na “META 1”, “MA” na “META 2”, “MPA” na “META 3”, “MPA” na “META 4” e “MA” na “META 5”
When eu adiciono as notas “MPA” na “META 1”, “MA” na “META 2”, “MA” na “META 3”, “MA” na “META 4” e “MA” na “META 5” de “Luana”
And eu adiciono as notas “MA” na “META 1”, “MA” na “META 2”, “MA” na “META 3”, “MA” na “META 4” e “MA” na “META 5” de “Hugo”
And eu adiciono as notas “MPA” na “META 1”, “MA” na “META 2”, “MPA” na “META 3”, “MPA” na “META 4” e “MA” na “META 5” de “Victor”
Then “Luana”, “Hugo” e “Victor” não são adicionados à lista da página de “alunos com notas discrepantes”

[MUDANCA MASTER 1]

Scenario: preenchimento das notas com discrepância
	Given que eu estou na página de “notas”
	And a aluna “Luana” tem a auto-avaliação “MA” na “META 1”, “MA” na “META 2”, “MA” na “META 3”, “MA” na “META 4” e “MA” na “META 5”
And o aluno “Hugo” tem a auto-avaliação “MPA” na “META 1”, “MANA” na “META 2”, “MPA” na “META 3”, “MPA” na “META 4” e “MPA” na “META 5”
And o aluno “Victor” tem a auto-avaliação “MA” na “META 1”, “MA” na “META 2”, “MA” na “META 3”, “MA” na “META 4” e “MA” na “META 5”
When eu adiciono as notas “MPA” na “META 1”, “MA” na “META 2”, “MA” na “META 3”, “MA” na “META 4” e “MA” na “META 5” de “Luana” [AJUDATANDO PROBLEMAS]
And eu adiciono as notas “MA” na “META 1”, “MA” na “META 2”, “MA” na “META 3”, “MA” na “META 4” e “MA” na “META 5” de “Hugo”
And eu adiciono as notas “MPA” na “META 1”, “MANA” na “META 2”, “MPA” na “META 3”, “MPA” na “META 4” e “MANA” na “META 5” de “Victor”
Then “Luana” e “Hugo” não são adicionados à lista da página de “alunos com notas discrepantes”
	And “Victor” é adicionado à lista da página de “alunos com notas discrepantes”
	And a porcentagem de discrepância de “Victor” é “100%”

[MUDANCA 1 DISCREPANTES]

[MUDANCA 2 DISCREPANTES]

pequeno ajuste no novo cenário de visualização de percentual de discrepância
