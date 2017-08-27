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

	Scenario preenchimento mal sucedido da auto-avaliação (GUI)
		Given Estou na página de "Auto-avaliação"
		When Preencho todos, menos um, conceitos na coluna de "Auto-avaliação" e confirmo
		Then Uma mensagem de erro com "Você não preenchou todos os campos da Auto-avaliação" aparece.

	Scenario preenchimento mal sucedido da auto-avaliação (Controlador)
		Given Estou na página de "Auto-avaliação"
		When O sistema recebe os conceitos preenchidos na coluna de "Auto-avaliação", e nota que faltou um.
		Then O sistema não armazena conceito algum.

	Scenario Não houve nenhuma discrepância.
		Given Todos os alunos submeteram todas as auto-avaliações e não houve nenhuma discrepância.
		When Eu requisito visualização da tabela de notas
		Then Eu vejo a tabela, com todos os dados preenchidos e calculados.

	Scenario Houve discrepância em 1 dos 3 alunos.
		Given Todos os alunos submeteram todas as auto-avaliações,e um deles obteve alta discrepância.		
		When Eu requisito visualização da tabela de notas.
		Then Eu vejo a tabela, com todos os dados preenchidos e calculados, e um sinal chamando minha atenção à porcentagem de discrepância do aluno em questão.