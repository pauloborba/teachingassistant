Feature:Auto Avaliação
As a professor
I want to cada aluno faça uma auto avaliaçao atribuindo um conceito a cada meta
so that eu terei a auto avaliação de meus alunos


Given o sistema possui as metas “Entender conceitos de requisitos”,
“Especificar requisitos com qualidade”, “Entender conceitos de gerência de configuração”
When o aluno “x” preenche as metas “Entender conceitos de requisitos” com o conceito “MA”,
“Especificar requisitos com Qualidade” com “MPA” e “Entender conceitos de gerência de configurações” com “MA”
Then o sistema armazena a auto-avaliação de metas do aluno “x”

Given o sistema possui os conceitos “Entender conceitos de requisitos”, “Especificar requisitos com qualidade”,
“Entender conceitos de gerência de configuração”
When o aluno “x” preenche os conceitos “Entender conceitos de requisitos” com “MA” e “Entender conceitos de gerência de configurações” com “MA”
Then o sistema não armazena as auto-avaliações do aluno “x” e lança uma exceção


Scenario: Sem discrepancias de auto avaliações
	Given eu estou na página de auto avaliações
	When eu peço a lista de auto avaliações discrepantes
	Then aparece uma lista vazia

Scenario: Uma discrepancia de auto avaliações
Given Eu estou na pagina de auto avaliações
And o aluno “X” possui discrepância em 3 auto avaliações
When eu peço a lista de auto avaliações discrepantes
Then aparece uma lista com quantidade “1”, percentual “33%” e lista de alunos “X”

