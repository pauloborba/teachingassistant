Scenario: Realizando Auto-avalia��o com aus�ncia de meta
	Given: estou em �auto-avalia��o�
	And: eu vejo as metas para poder inserir a nota
	When: eu clico em uma meta consigo colocar (MA ou MPA ou MANA)
	And: coloco �MA� em todas notas, menos em uma meta
	Then: o bot�o de enviar notas n�o � liberado
	And: n�o consigo enviar as notas para o sistema
	And: o sistem avisa que falta nota a ser preenchida


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

Service Scenario: Armazenamento de auto-avalia��o com aus�ncia de Meta
	Given: aluno �Henrique� devidamente logado
	And: A lista de auto-avalia��o est� preenchida com Notas �MA�
	And: um campo de nota est� vazio ��
	When: Eu tento enviar a lista de auto-avalia��o para o sistema
	Then: O sistema n�o recebe nenhuma lista de auto-avalia��o
	And: O sistema espera o Aluno terminar de preencher a lista de auto-avalia��o

Scenario: Armazenamento de auto-avalia��o com Metas atribu�das
	Given: aluno �Henrique� devidamente logado
	And: A lista de auto-avalia��o est� preenchida com notas �MA�
	When: O sistema recebe uma lista de auto-avalia��o
	Then: A lista � devidamente armazenada no sistema
	And: feedback positivo � demonstrado na tela
