Feature Auto-Avaliação
As a Aluno
I want to atribuir conceitos “MA”, “MPA” ou “MANA” para cada uma das metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, etc.
So that eu e o professor possamos ver o que cada um pensa que foi o conceito merecido de cada uma das metas avaliadas.

-Controlador:
	Scenario: preenchimento bem sucedido da Auto-Avaliação 
		Given: O sistema apenas recebe os conceitos “MA”, “MPA” ou “MANA” e possui as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”.
		When: O aluno “Thiago” submete suas metas preenchidas com os conceitos “MA”, “MPA” e “MANA” nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, respectivamente, para o sistema.
		Then: O sistema armazena os conceitos “MA”, “MPA” e “MANA” nas metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, respectivamente, submetidas pelo aluno “Thiago”.
-GUI:
		Scenario: Preenchimento bem sucedido da Auto-Avaliação
		Given: O aluno “Thiago” está na página de “auto-avaliação”
		When: O aluno “Thiago” preenche as metas “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração” com os conceitos “MA”, “MPA” e “MANA”, respectivamente.
		And: O aluno “Thiago” envia suas respostas.
		Then: O aluno “Thiago” vê uma mensagem confirmando o envio bem sucedido
		And fecha o navegardor.
