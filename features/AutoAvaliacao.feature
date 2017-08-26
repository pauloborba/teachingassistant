Feature: auto-avaliação
	As um estudante
	I quero atribuir conceitos, que eu acho que mereço, a cada meta avaliada durante a cadeira
	So o professor tenha noção de disparidades.
	
GUI:
Cenário: auto-avaliação de conceitos
	Given que eu estou logado como o aluno "Pedro"
	And eu estou na página “Conceitos obtidos”
	And eu vejo todos os conceitos obtidos nas metas "MANA", "MANA", "MANA"
	When eu seleciono a opção “Auto-avaliar”
	And preencho minha auto-avaliação completamente com "MA", "MA", "MA"
	And seleciono a opção "Salvar auto-avaliação"
	Then vejo uma mensagem de confirmação "Auto-avaliação preenchida com sucesso".

Controlador:
Cenário: auto-avaliação de conceitos
    Given que o sistema possui todos os conceitos atribuídos ao aluno "Pedro" já disponíveis "MANA", "MANA", "MANA"
	And "Paulo" seja o professor de "Pedro"
    When o aluno "Pedro" informa todos os conceitos que acredita que merece "MA", "MA", "MA"
    Then "MA", "MA", "MA" são salvos como a auto-avaliação
	And o professor "Paulo" recebe uma notificação "Pedro concluiu a auto-avaliação".
	
Controlador:
Cenário: auto-avaliação inválida de conceitos
	Given que o sistema possua 3 metas com os conceitos "MANA", "MANA", "MANA" a serem auto-avaliadas
	When o aluno informar de forma parcial os conceitos que acha que merece "MA", "MA"
	Then o sistema não deve salvar os conceitos informados pelo aluno porque todos os conceitos precisam ser informados.
	
GUI:
Cenário: auto-avaliação inválida de conceitos
	Given que eu estou logado como o aluno "Pedro"
	And eu estou na página “Conceitos obtidos”
	And eu vejo todos os conceitos obtidos nas metas "MANA", "MANA", "MANA"
	When eu seleciono a opção "Auto-avaliar"
	And eu informo de forma parcial os conceitos que acredito merecer "MA", "MA"
	And eu seleciono a opção "Salvar auto-avaliação"
	Then aparecerá uma mensagem de erro  "Só é possível auto-avaliar todos os conceitos de uma vez"