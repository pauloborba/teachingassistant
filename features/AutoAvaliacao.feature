Feature: auto-avaliação
As a aluno 
I want to me auto-avaliar, atribuindo conceitos (MA, MPA, MANA) para algumas metas.
So that possa-se comparar os conceitos atribuídos pelo professor e pelo aluno na mesma tela.

Bem Sucedidos
	Scenario: Preencher as metas com conceitos como auto-avaliação 
		Given: No sistema, o aluno “Fulano” não possui nenhuma meta com conceitos auto-avaliados.
		When: Eu peço os conceitos de “Fulano”.
		Then: O sistema mostra “MA, MA, MA, MA, MA” para as seguintes metas: “Entender conceitos de requisitos”,
		“Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de testes”,
		“Entender conceitos de refatoração” respectivamente como os conceitos da auto-avaliação de “Fulano”. 
	
	Scenario: Preencher as metas com conceitos como auto-avaliação
		Given: O aluno não tem nenhuma meta com conceitos auto-avaliados.
		When: eu vou para “página de visualização de conceito”
		Then: Na linha “fulano”, eu vejo “MA, MA, MA, MA, MA” nas colunas “Entender conceitos de requisitos”,
		“Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”, “Entender conceitos de testes”,
		“Entender conceitos de refatoração” respectivamente.
	
Mal Sucedidos	
	Scenario: Preencher metas com conceitos
		Given: No sistema, o aluno “Fulano” ainda não possui notas preenchidas para a meta “Entender conceitos de requisitos”.
		When: Eu preencho a nota “MPA” de “Fulano” para o conceito “Entender conceitos de requisitos”. 
		Then: O sistema não faz o preenchimento das metas.

	Scenario: Preencher metas com conceitos
		Given: Eu estou na página “preenchimento de conceitos”
		And: O “aluno fulano” não tem metas com conceitos.
		When: Eu preencho a nota “MA” de “Entender conceitos de requisitos”.
		Then: Vejo na tela uma mensagem informando que faltou/faltaram nota(s) ser(em) preenchida(s). 
		
Sem Discrepância
	Scenario: Ver página de auto-avaliações discrepantes
		Given: O aluno “Fulano” tem um conceito inferior na meta “entender conceitos de requisitos”
		And: O aluno “Beltrano” possui apenas conceitos superiores.
		And: O aluno “Sicrano” possui apenas conceitos iguais.
		When: eu vou para “página de visualização de auto-avaliações discrepantes”
		Then: Eu vejo na coluna “Aluno” não vejo nenhum nome, na coluna “Total de Alunos” vejo “0” e por fim, na coluna “Porcentagem” há “0%”.