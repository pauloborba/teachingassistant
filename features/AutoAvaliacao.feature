Scenario: Realizando Auto-avaliação com ausência de meta
	Given: estou em “auto-avaliação”
	And: eu vejo as metas para poder inserir a nota
	When: eu clico em uma meta consigo colocar (MA ou MPA ou MANA)
	And: coloco “MA” em todas notas, menos em uma meta
	Then: o botão de enviar notas não é liberado
	And: não consigo enviar as notas para o sistema
	And: o sistema avisa que está faltando uma nota

