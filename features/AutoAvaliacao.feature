Scenario: Realizando auto-avalia��o corretamente
	Given: estou em �auto-avalia��o�
	And: eu vejo as metas para poder inserir a nota
	When: eu clico em uma meta consigo colocar (MA ou MPA ou MANA)
	And: depois de colocar todas as notas �MANA�
	Then: eu posso ver o bot�o de enviar as notas
	And: eu consigo ver um feedback positivo de que foi enviado
