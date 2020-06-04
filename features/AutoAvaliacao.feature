Feature: Auto-avaliação do sistema de metas
As a: Aluno
I want to: Eu posso me avaliar com as metas cadastradas no sistema

Scenario: Realizando auto-avaliação de conceitos  
	Given: Eu estou na  página de “auto-avaliação ”.
	When:  Eu preencho as “meta 1”, “meta 2 e “meta 3 com “MPA” , “MANA” e “MA”
	Then: Eu vejo na tela uma mensagem de confirmação da avaliação