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
        	Given: O aluno “A” está na página “Auto-Avaliação”
			And: a meta “X” está com o conceito “MA”
			And: a meta “Y” com “MPA” 
			And: a meta “Z” em branco.
        	When: O aluno “A” envia sua auto-avaliação
        	Then: O aluno “A” vê uma mensagem de erro
			And: O aluno "A" volta para a pagina inicial
	
	//Feature Discrepancia
	
	-GUI:
		Scenario: O professor “P” não visualiza nenhuma discrepância.
		Given: O professor “P” está na planilha com os resultados das auto-avaliações dos alunos “A”, “B”, “C”.
		And: As metas avaliadas foram “V”, “W”, “X”, “Y” e “Z”.
		And: Aluno “A” preencheu as metas com os conceitos “MA”, “MA”, “MPA”, “MPA”, “MA”, respectivamente.
		And: Aluno “B” preencheu as metas com os conceitos “MPA”, “MPA”, “MPA”, “MPA”, “MANA”, respectivamente.
		And: Aluno “C” preencheu as metas com os conceitos “MA”, “MPA”, “MPA”, “MPA”, “MA”, respectivamente.
		When: O professor “P” preencheu as metas do aluno “A” com os conceitos “MPA”, “MA”, “MPA”, “MPA”, “MA”, respectivamente.
		And: O professor “P” preencheu as metas do aluno “B” com os conceitos “MA”, “MA”, “MA”, “MPA”, “MA”, respectivamente.
		And: O professor “P” preencheu as metas do aluno “C” com os conceitos “MA”, “MPA”, “MPA”, “MPA”, “MA”, respectivamente.
		Then: O professor visualiza que na página dos resultados que nenhuma discrepância é alertada.
	-GUI
		Scenario: Alunos “A” e “B” não possuem discrepância, mas aluno “C” possui discrepância
		Given: O professor “P” está na planilha com os resultados das auto-avaliações dos alunos “A”, “B”, “C”.
		And: As metas avaliadas foram “V”, “W”, “X”, “Y” e “Z”.
		And: Aluno “A” preencheu as metas com os conceitos “MA”, “MA”, “MPA”, “MPA”, “MA”, respectivamente.
		And: Aluno “B” preencheu as metas com os conceitos “MPA”, “MPA”, “MPA”, “MPA”, “MANA”, respectivamente.
		And: Aluno “C” preencheu as metas com os conceitos “MA”, “MA”, “MA”, “MA”, “MA”, respectivamente.
		When: O professor “P” preencheu as metas do aluno “A” com os conceitos “MPA”, “MA”, “MPA”, “MPA”, “MA”, respectivamente.
		And: O professor “P” preencheu as metas do aluno “B” com os conceitos “MA”, “MA”, “MA”, “MPA”, “MA”, respectivamente.
		And: O professor “P” preencheu as metas do aluno “C” com os conceitos “MA”, “MPA”, “MPA”, “MPA”, “MA”, respectivamente.
		Then: O professor visualiza que na página dos resultados que uma discrepância foi alertada.
		And: O professor verifica o alerta.
