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

-Controlador:
		Scenario: Preenchimento mal sucedido da Auto-Avaliação
		Given: O Sistema aceita somente conceitos “MA”, “MPA” ou “MANA”.
		And: O Sistema possui as metas  “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”.
		When: O aluno “Thiago” submete sua auto-avaliação com a meta  “Entender conceitos de requisitos” com conceito “MA”
		And a meta  “Entender conceitos de requisitos” com “MPA”
		Then: O Sistema não armazena a submissão.

-GUI:
		Scenario: Preenchimento mal sucedido da Auto-Avaliação
		Given: O aluno “Thiago” está na página “Auto-Avaliação”, a meta “Entender conceitos de requisitos” está com o conceito “MA”
		And a meta “Especificar requisitos com qualidade” com “MPA”		
		When: O aluno “Thiago” envia sua auto-avaliação
		Then: O aluno “Thiago” vê uma mensagem de erro.