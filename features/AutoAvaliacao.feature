Scenario: Realizando Auto-avalia��o com aus�ncia de meta
	Given: estou em �auto-avalia��o�
	And: eu vejo as metas para poder inserir a nota
	When: eu clico em uma meta consigo colocar (MA ou MPA ou MANA)
	And: coloco �MA� em todas notas, menos em uma meta
	Then: o bot�o de enviar notas n�o � liberado
	And: n�o consigo enviar as notas para o sistema
	And: o sistema avisa que est� faltando uma nota


Scenario: Nenhuma discrep�ncia nas auto-avalia��es dos alunos
	Given: professor �borba� est� devidamente logado
	And: est� na p�gina �Disciplinas�
	When: quando clica em uma de suas disciplinas ministradas �ESS�
	Then: aparece um pop-up com um feedback positivo 
	And: n�o houve nenhum aluno com auto-avalia��o discrepante

Scenario: Discrep�ncia nas auto-avalia��es de alunos
			Given: professor �borba� est� devidamente logado
			And: est� na p�gina �Disciplinas�
			When: quando clica em uma de suas disciplinas ministradas �ESS�
			Then: aparece um bal�o em destaque com o percentual �33%�, a quantidade �1�, e a lista de alunos �Henrique Andrade Mariz� que est�o com auto-avalia��es discrepantes
