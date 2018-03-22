Sistema de Auto-Avaliação
Atribuir conceitos as metas da unidade

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


	-Controlador:
        	Scenario: O aluno “A” submeteu a auto-avaliação sem um conceito “MA”, “MPA” ou “MANA” na meta “Z”.
        	Given: O Sistema aceita somente conceitos “MA”, “MPA” ou “MANA”.
        	And: O Sistema possui as metas “X”, “Y” e “Z”.
        	When: O aluno “A” submete sua auto-avaliação com a meta “X” com conceito “MA”, a meta “Y” com “MPA” e a meta “Z” em branco.
        	Then: O Sistema não armazena a submissão.

    -GUI:
        	Scenario: O aluno “A” submeteu a auto-avaliação sem um conceito “MA”, “MPA” ou “MANA” na meta “Z”.
        	Given: O aluno “A” está na página “Auto-Avaliação”, a meta “X” está com o conceito “MA”, a meta “Y” com “MPA” e a meta “Z” em branco.
        	When: O aluno “A” envia sua auto-avaliação
        	Then: O aluno “A” vê uma mensagem de erro.

