Feature: auto-avaliação
As a aluno 
I want to me auto-avaliar, atribuindo conceitos (MA, MPA, MANA) para algumas metas.
So that possa-se comparar os conceitos atribuídos pelo professor e pelo aluno na mesma tela.

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