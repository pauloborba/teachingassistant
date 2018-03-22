Gerenciar notas de alunos
Modificar, excluir e inserir notas

-Controlador:
		Scenario: O aluno “A” preencheu as metas “X”, “Y” e “Z” 
		Given: O sistema recebe apenas os conceitos “MA”, “MPA” ou “MANA” e possui as metas “X”, “Y” e “Z”.
		When: O aluno “A” submete suas metas preenchidas com os conceitos “MA”, “MPA” e “MANA” nas metas “X”, “Y” e “Z”, respectivamente, para o sistema.
		Then: O sistema armazena os conceitos “MA”, “MPA” e “MANA” nas metas “X”, “Y” e “Z”, respectivamente, submetidas pelo aluno “A”.
	
	-GUI:
		Scenario: O aluno “A” preencheu as metas “X”, “Y” e “Z”.
		Given: O aluno “A” está na página de “auto-avaliação”
		When: O aluno “A” preenche as metas “X”, “Y” e “Z” com os conceitos “MA”, “MPA” e “MANA”, respectivamente.

		And: O aluno “A” envia suas respostas.

		Then: O aluno “A” vê uma mensagem confirmando o envio bem sucedido.

