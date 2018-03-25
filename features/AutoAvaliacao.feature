Scenario Auto-avaliação bem sucedida
	Given Eu estou logado no sistema com login "Abc@abc.com" e senha "123456"
	And Eu estou na página de auto-avaliação
	When Eu preencho minha auto-avaliação
	And Salvo os dados
	Then A auto-avaliação é salva

Scenario Preenchimento de Auto-avaliação mal sucedido
	Given Eu estou logado no sistema com login "Abc@abc.com" e senha "123456"
	And Eu estou na página de auto-avaliação
	When Eu preencho minha auto-avaliação
	And Deixo apenas uma avaliação faltando
	And Salvos os dados
	Then A Auto-avaliação não é salva
	
Scenario Discrepancia de auto-avaliaçao
	Given Eu estou logado no sistema como professor
	And Eu estou na página de listar avaliações dos alunos
	When Não há discrepancia nas avaliações dos alunos
	And eu clico no botão submeter
	Then As avaliações dos alunos são salvas com successo


