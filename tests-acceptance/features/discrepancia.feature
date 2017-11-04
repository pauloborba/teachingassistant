Feature: As a Professor
		 I want to visualizar a lista de alunos que fizeram auto avaliacao com discrepancias em relacao a minha avaliacao
		 So that eu possa analisar os casos em que minha avaliação pode ter prejudicado os alunos, para poder discuti-la quando necessario.


Scenario: Não há nenhuma discrepância entre o professor e nenhum aluno
	Given que estou na pagina de avaliações
	And as metas avaliadas são “Entender motivação e conceitos de requisitos”, “Entender motivação e conceitos de testes”, “usar com eficácia um sistema de controle de versão distribuído”, “Definir com qualidade e seguir tarefas, epics e iterações” e “Implementar com qualidade features e cenários”, respectivamente
	And a aluna “Larícia Maria” se auto avaliou como  “MPA”, “MPA”, “MA”, “MA” e “MPA”, respectivamente
	And o professor avaliou  “Larícia Maria” como  “MPA”, “MPA”, “MA”, “MA” e “MPA” respectivamente
	And a aluna “Pamella Bezerra” se auto avaliou como “MPA”, “MPA”, “MPA”, “MANA” e “MA”, respectivamente 
	And o professor avaliou  “Pamella Bezerra” como “MPA”, “MPA”, “MPA”, “MANA” e “MA”, respectivamente
	And a aluna “Maria Luiza” se auto avaliou como “MPA”, “MPA”, “MA”, “MA”e “MPA”, respectivamente
	And o professor avaliou “Maria Luiza” como  “MPA”, “MPA”, “MA”, “MA”, e “MPA”, respectivamente
	When o professor for para a opção de “Discrepâncias”
	Then verá as estatísticas da turma
	And verá uma mensagem indicando que não há discrepâncias

Scenario: discrepância entre a avaliação do professor Paulo Borba e da aluna Larícia Maria
	Given que estou na pagina de avaliações
	And as metas avaliadas são “Entender motivação e conceitos de requisitos”, “Entender motivação e conceitos de testes”, “usar com eficácia um sistema de controle de versão distribuído”, “Definir com qualidade e seguir tarefas, epics e iterações” e “Implementar com qualidade features e cenários”, respectivamente
	And a aluna “Larícia Maria” se auto avaliou como  “MPA”, “MPA”, “MA”, “MA” e “MPA”, respectivamente.
	And o professor avaliou  “Larícia Maria” como  “MPA”, “MPA”, “MPA”, “MPA” e “MANA”, respectivamente
	And a aluna “Pamella Bezerra” se auto avaliou como “MPA”, “MPA”, “MPA”, “MANA” e “MA”, respectivamente
	And o professor avaliou  “Pamella Bezerra” como “MPA”, “MPA”, “MPA”, “MANA” e “MA”, respectivamente
	And a aluna “Maria Luiza” se auto avaliou como  “MPA”, “MPA”, “MA”, “MA” e “MPA”, respectivamente
	And o professor avaliou  “Maria Luiza” como  “MPA”, “MPA”, “MA”, “MA” e “MPA”, respectivamente
	When o professor abrir a página de Discrepancias
	Then o professor verá a planilha de auto avaliação de “Larícia Maria” destacada
	And o professor verá as estatísticas de da turma
