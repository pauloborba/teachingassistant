Feature: auto-avaliação
	As um estudante
	I quero atribuir conceitos, que eu acho que mereço, a cada meta avaliada durante a cadeira
	So o professor tenha noção de disparidades.
	
GUI:
Cenário: auto-avaliação de conceitos
	Given que eu esteja logado como o aluno "Pedro"
	And eu esteja na página “Conceitos obtidos”
	And eu vejo todos os conceitos obtidos nas metas
	When eu selecionar a opção “Auto-avaliar”
	And preencher minha auto-avaliação completamente
	Then eu poderei salvar minha auto-avaliação
	And verei uma mensagem de confirmação "Auto-avaliação preenchida com sucesso".

Controlador:
Cenário: auto-avaliação de conceitos
    Given que o sistema possui todos os conceitos atribuídos ao aluno "Pedro" já disponíveis
	And "Paulo" seja o professor de "Pedro"
    When o aluno "Pedro" informa todos os conceitos que acredita que merece
    Then esses conceitos são salvos e o professor "Paulo" recebe uma notificação "Pedro concluiu a auto-avaliação".