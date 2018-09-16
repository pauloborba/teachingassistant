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
		Then: O aluno “Thiago” vê uma mensagem de erro e volta para a página inicial.

-Sem discrepancia
	-GUI:
			Scenario: O professor “Paulo” não visualiza nenhuma discrepância.
			Given: O professor "Paulo" está na planilha com os resultados das auto-avaliações dos alunos "André", "Bernardo", "Caio".
			And: As metas avaliadas foram “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de SaaS ”, “Entender conceitos de gerência de projeto”.
			And: Aluno "André" preencheu as metas com os conceitos “MA”, “MA”, “MPA”, “MPA”, “MA”, respectivamente.
			And: Aluno "Bernardo" preencheu as metas com os conceitos “MPA”, “MPA”, “MPA”, “MPA”, “MANA”, respectivamente.
			And: Aluno "Caio" preencheu as metas com os conceitos “MA”, “MPA”, “MPA”, “MPA”, “MA”, respectivamente.
			When: O professor "Paulo" preencheu as metas do aluno "André" com os conceitos “MPA”, “MA”, “MPA”, “MPA”, “MA”, respectivamente.
			And: O professor "Paulo" preencheu as metas do aluno "Bernardo" com os conceitos “MA”, “MA”, “MA”, “MPA”, “MA”, respectivamente.
			And: O professor "Paulo" preencheu as metas do aluno "Caio" com os conceitos “MA”, “MPA”, “MPA”, “MPA”, “MA”, respectivamente.
			Then: O professor visualiza que na página dos resultados que nenhuma discrepância é alertada.

-Com discrepancia
	-GUI:
			Scenario: Discrepância em 1 de 3 alunos.
			Given: O professor "Paulo" está na planilha com os resultados das auto-avaliações dos alunos "André", "Bernardo", "Caio".
			And: As metas avaliadas foram “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de SaaS ”, “Entender conceitos de gerência de projeto”, "Entender conceitos de testes".
			And: Aluno "André" preencheu as metas com os conceitos “MA”, “MA”, “MPA”, “MPA”, “MA”, respectivamente.
			And: Aluno "Bernardo" preencheu as metas com os conceitos “MPA”, “MPA”, “MPA”, “MPA”, “MANA”, respectivamente.
			And: Aluno "Caio" preencheu as metas com os conceitos “MA”, “MA”, “MA”, “MA”, “MA”, respectivamente.
			When: O professor "Paulo" preencheu as metas do aluno "André" com os conceitos “MPA”, “MA”, “MPA”, “MPA”, “MA”, respectivamente.
			And: O professor "Paulo" preencheu as metas do aluno "Bernardo" com os conceitos “MA”, “MA”, “MA”, “MPA”, “MA”, respectivamente.
			And: O professor "Paulo" preencheu as metas do aluno "Caio" com os conceitos “MA”, “MPA”, “MPA”, “MPA”, “MA”, respectivamente.
			Then: O professor visualiza que na página dos resultados que uma discrepância foi alertada  e uma notificação de prioridade
			