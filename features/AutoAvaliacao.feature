Feature: auto-avaliação
As a: Aluno da turma de ESS
I want to: realizar e enviar minha auto-avaliação
So that: eu posso medir meu desempenho no curso
Given: O sistema apresenta as seguintes metas 
“Entender conceitos de requisitos”, “Especificar requisitos com qualidade”, “Entender conceitos de gerência  de configuração”
And os conceitos “MA”, “MPA”, “MANA”
		When: O aluno “X” enviou a sua auto-avaliação com 
“MA” em “Entender conceitos de requisitos”
		And  “MA” em “Especificar requisitos com qualidade” 
And ”MA” em “Entender conceitos de gerência  de configuração”
		Then: O sistema armazenou a auto-avaliação do aluno “X” com 
“MA” em “Entender conceitos de requisitos”
		And  “MA” em “Especificar requisitos com qualidade” 
And ”MA” em “Entender conceitos de gerência  de configuração”