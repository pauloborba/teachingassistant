Scenario: Realizando Auto-avalia��o com aus�ncia de meta
	Given: estou em �auto-avalia��o�
	And: eu vejo as metas para poder inserir a nota
	When: eu clico em uma meta consigo colocar (MA ou MPA ou MANA)
	And: coloco �MA� em todas notas, menos em uma meta
	Then: o bot�o de enviar notas n�o � liberado
	And: n�o consigo enviar as notas para o sistema
	And: o sistema avisa que est� faltando uma nota

