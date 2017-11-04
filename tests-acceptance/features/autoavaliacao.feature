Feature: As a aluno
		 I want to me auto avaliar, vendo também, ao mesmo instante, o conceito que meu professor me deu. Essa avaliação precisa ser realizada de uma única vez, não me permitindo finalizar sem preencher todas as metas
		 So that eu possa analisar meu desempenho, comparar com o professor e ver quais aspectos preciso melhorar.

Scenario:	Auto avaliação preenchida corretamente
			Given que estou na página de auto avaliação
		 	And a aluna “Maria Luiza” com CPF "123" se auto avaliou como “MPA” em “Entender motivação e conceitos de requisitos”, “MANA” em “Entender motivação e conceitos de testes” e “MA” em “usar com eficácia um sistema de controle de versão distribuído"
		 	When finalizar a autoavaliacao
		 	Then uma mensagem de confirmação é mostrada

Scenario: 	Auto avaliação não preenchida corretamente.
			Given estou na página de autoavaliação
			And a aluna “Maria Luiza” com CPF "123" se auto avaliou como “MANA” em “Entender motivação e conceitos de testes” e “MA” em “usar com eficácia um sistema de controle de versão distribuído, 
			And não se preencheu a meta “Entender motivação e conceitos de requisitos”
			When “Maria Luiza” finalizar a autoavaliacao
			Then aparecerá uma mensagem de erro
			And a meta “Entender motivação e conceitos de requisitos” é destacada.