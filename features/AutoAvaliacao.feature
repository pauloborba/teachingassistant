Feature Auto-avaliação do aluno.
		As a Aluno da turma.
		I want to me auto-avaliar, colocando o conceito que penso merecer, para cada meta so that eu possa ver o contraste entre o meu julgamento e o do professor, e me reavaliar, para poder tomar decisões para o meu futuro na disciplina.

	Scenario preenchimento bem sucedido da auto-avaliação (GUI)
		Given Estou na página de "Auto-avaliação"
		When eu preencho os conceitos na coluna de "Auto-avaliação" e confirmo
		Then posso ver uma mensagem de confirmação de preenchimento bem sucedido

	Scenario preenchimento bem sucedido da auto-avaliação (Controlador)
		Given Estou na página de "Auto-avaliação"
		When O sistema recebe os conceitos preenchidos pelo usuário na coluna de "Auto-avaliação"
		Then O sistema armazena no seu banco de dados e atualiza a tabela daquele determinado aluno.