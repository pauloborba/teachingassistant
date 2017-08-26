Feature: auto-avaliação
	As um estudante
	I quero atribuir conceitos, que eu acho que mereço, a cada meta avaliada durante a cadeira
	So o professor tenha noção de disparidades.
	
GUI:
Cenário: auto-avaliação de conceitos
	Given que eu esteja logado como o aluno "Pedro"
	And eu esteja na página “Conceitos obtidos”
	And eu vejo todos os conceitos obtidos nas metas "MANA", "MANA", "MANA"
	When eu selecionar a opção “Auto-avaliar”
	And preencher minha auto-avaliação completamente com "MA", "MA", "MA"
	Then eu poderei salvar minha auto-avaliação
	And verei uma mensagem de confirmação "Auto-avaliação preenchida com sucesso".

Controlador:
Cenário: auto-avaliação de conceitos
    Given que o sistema possui todos os conceitos atribuídos ao aluno "Pedro" já disponíveis "MANA", "MANA", "MANA"
	And "Paulo" seja o professor de "Pedro"
    When o aluno "Pedro" informa todos os conceitos que acredita que merece "MA", "MA", "MA"
    Then "MA", "MA", "MA" são salvos como a auto-avaliação
	And o professor "Paulo" recebe uma notificação "Pedro concluiu a auto-avaliação".