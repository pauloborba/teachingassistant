Scenario: Realizando auto-avaliação corretamente
	Given: estou em “auto-avaliação”
	And: eu vejo as metas para poder inserir a nota
	When: eu clico em uma meta consigo colocar (MA ou MPA ou MANA)
	And: depois de colocar todas as notas “MANA”
	Then: eu posso ver o botão de enviar as notas
	And: eu consigo ver um feedback positivo de que foi enviado
