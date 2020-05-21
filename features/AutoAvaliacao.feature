Cenário 1: Fazendo auto-avaliação com sucesso
	Dado que eu estou logado como aluno de login "mgrf" e senha "123456" no sistema
	E estou na tela de "auto-avaliação"
	E há uma tabela apresentando os conceitos de cada meta
	E as metas "Meta 1", "Meta 2" e "Meta 3" não estão preenchidas
	E as metas "Meta 1", "Meta 2" e "Meta 3" estão disponíveis para serem preenchidas
	Quando eu atribuir
		o conceito "MPA" para "Meta 1"
		E o concetito "MA" para "Meta 2"
		E o concetito "MA" para "Meta 3"
	E confirmar as alterações
	Então um diálogo será exibido com a mensagem "sucesso"
	E as metas "Meta 1", "Meta 2" e "Meta 3" estão preenchidas com "MPA", "MA" e "MA" respectivamente.
	E o botão de confirmação não estará mais disponível.
